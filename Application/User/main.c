/**
  ******************************************************************************
  * @file    HTTPS_CLient_ADE/Appllication/User/main.c
  * @author  Faiçal FQUIHI
  *
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2025 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "cmsis_os.h"
#include "ethernetif.h"
#include "lwip/netif.h"
#include "lwip/tcpip.h"
#include "app_ethernet.h"
#ifdef USE_LCD
#include "lcd_log.h"
#endif







/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
//struct netif gnetif; /* network interface structure */
RNG_HandleTypeDef RngHandle;
struct netif gnetif_main;

volatile uint8_t ready_to_show = 0;

/* Private function prototypes -----------------------------------------------*/
static void SystemClock_Config(void);
static void StartThread(void const * argument);
static void BSP_Config(void);
static void Netif_Config(void);
static void MPU_Config(void);
static void CPU_CACHE_Enable(void);
static void RNG_Init(void);


void SSL_Client(void const *argument);

volatile uint8_t g_calendar_ready = 0;
char g_calendar_buffer[4096]; //__attribute__((section(".sdram")))
size_t g_calendar_size = 0;



SDRAM_HandleTypeDef sdramHandle;
extern LTDC_HandleTypeDef hLtdcHandler;





#define MAX_EVENTS 20
#define MAX_SUMMARY_LEN 64

typedef struct {
    int jour;
    int heure;
    char summary[MAX_SUMMARY_LEN];
} CalendarEvent;

CalendarEvent events[MAX_EVENTS];
int event_count = 0;



void parse_calendar_buffer(const char *buffer) {

    const char *ptr = buffer;
    event_count = 0;

    while ((ptr = strstr(ptr, "BEGIN:VEVENT")) && event_count < MAX_EVENTS) {
        const char *end_vevent = strstr(ptr, "END:VEVENT");
        if (!end_vevent) break;

        const char *start_dt = strstr(ptr, "DTSTART:");
        const char *summary = strstr(ptr, "SUMMARY:");

        if (start_dt && summary && summary < end_vevent) {
            int y, M, d, h, m;
            sscanf(start_dt, "DTSTART:%4d%2d%2dT%2d%2dZ", &y, &M, &d, &h, &m);

            // Calcul du jour de la semaine
            struct tm timeinfo = {0};
            timeinfo.tm_year = y - 1900;
            timeinfo.tm_mon = M - 1;
            timeinfo.tm_mday = d;
            mktime(&timeinfo);
            int weekday = (timeinfo.tm_wday + 6) % 7; // Lundi = 0

            if (weekday >= 0 && weekday <= 4) { // Lun à Ven
                int heure_idx = (h - 8) / 2;
                if (heure_idx >= 0 && heure_idx <= 5) { // jusqu’à 18h
                    CalendarEvent *evt = &events[event_count];
                    evt->jour = weekday;
                    evt->heure = heure_idx;

                    const char *sum_start = summary + 8;
                    const char *sum_end = strchr(sum_start, '\n');
                    int len = sum_end ? sum_end - sum_start : MAX_SUMMARY_LEN - 1;
                    if (len > MAX_SUMMARY_LEN - 1) len = MAX_SUMMARY_LEN - 1;

                    strncpy(evt->summary, sum_start, len);
                    evt->summary[len] = '\0';
                    event_count++;
                }
            }
        }

        ptr = end_vevent + strlen("END:VEVENT");
    }
}






void draw_schedule_bsp(void)
{
	BSP_LCD_Clear(LCD_COLOR_WHITE);

	const char *jours[] = {"Lun", "Mar", "Mer", "Jeu", "Ven"};
    const char *heures[] = {"08h", "10h", "12h", "14h", "16h", "18h"};

    int col_width = 80;
    int row_height = 40;
    int start_x = 60;
    int start_y = 40;

    int nb_jours = 5;
    int nb_heures = 6;

    // Fond blanc
    BSP_LCD_SetBackColor(LCD_COLOR_WHITE);
    BSP_LCD_Clear(LCD_COLOR_WHITE);

    // Texte noir par défaut
    BSP_LCD_SetTextColor(LCD_COLOR_BLACK);
    BSP_LCD_SetFont(&Font16);

    // Affichage des entêtes de colonnes (jours)
    for (int j = 0; j < nb_jours; j++) {
        BSP_LCD_DisplayStringAt(start_x + j * col_width + 10, 10, (uint8_t *)jours[j], LEFT_MODE);
    }

    // Affichage des entêtes de lignes (heures)
    for (int h = 0; h < nb_heures; h++) {
        BSP_LCD_DisplayStringAt(10, start_y + h * row_height + 10, (uint8_t *)heures[h], LEFT_MODE);
    }

    // Dessin de la grille vide
    for (int row = 0; row < nb_heures; row++) {
        for (int col = 0; col < nb_jours; col++) {
            int x = start_x + col * col_width;
            int y = start_y + row * row_height;

            BSP_LCD_SetTextColor(LCD_COLOR_BLACK);
            BSP_LCD_DrawRect(x, y, col_width, row_height);
        }
    }

    // Affichage des événements parsés
    for (int i = 0; i < event_count; i++) {
        int col = events[i].jour;
        int row = events[i].heure;

        if (col >= 0 && col < nb_jours && row >= 0 && row < nb_heures) {
            int x = start_x + col * col_width;
            int y = start_y + row * row_height;

            BSP_LCD_SetTextColor(LCD_COLOR_BLUE);
            BSP_LCD_SetFont(&Font8);

            // Texte divisé en deux lignes max
            char line1[21] = {0};
            char line2[21] = {0};

            strncpy(line1, events[i].summary, 20);
            if (strlen(events[i].summary) > 20) {
                strncpy(line2, events[i].summary + 20, 20);
            }

            BSP_LCD_DisplayStringAt(x + 3, y + 5, (uint8_t *)line1, LEFT_MODE);
            BSP_LCD_DisplayStringAt(x + 3, y + 20, (uint8_t *)line2, LEFT_MODE);
        }
    }
}








void LCD_StartupDisplayTask(void const * argument)
{
    static uint8_t lcd_log_displayed = 0;

    while (ready_to_show == 0)
    {

    	LCD_LOG_SetHeader((uint8_t *)" Client HTTPS - Emploi du temps ENSEA ADE");
    	LCD_LOG_SetFooter((uint8_t *)"STM32746G-DISCO");


        if (lcd_log_displayed == 0)
        {

        	LCD_UsrLog ("  State: Ethernet Initialization ...\n");
            LCD_UsrLog ("  State: Ethernet Initialization ...\n");

            lcd_log_displayed = 1;
        }

        osDelay(100);
    }
    osDelay(3000);
    /* Une fois @IP assignée */

    osThreadTerminate(NULL);
}

void StartLEDTask(void *argument)
{
    for (;;) {
        HAL_GPIO_TogglePin(GPIOI, GPIO_PIN_1);  // LED sur STM32F746G-DISCO
        vTaskDelay(pdMS_TO_TICKS(500));         // Delay de 500 ms
    }
}


void Calendar_Display_Task(){

	while(g_calendar_ready!=1){osDelay(100);}

	parse_calendar_buffer(g_calendar_buffer);
	BSP_LCD_Clear(LCD_COLOR_WHITE);
	osDelay(100);

	draw_schedule_bsp();
	osDelay(2000);
	 for( ;; )
	  {
		  osThreadTerminate(NULL);
	  }

}



/* Private functions ---------------------------------------------------------*/

/**
  * @brief  Main program
  * @param  None
  * @retval None
  */
int main(void)
{
  /* Configure the MPU attributes as Device memory for ETH DMA descriptors */
  //MPU_Config();
	MPU_Config();

  /* Enable the CPU Cache */
  CPU_CACHE_Enable();

  /* STM32F7xx HAL library initialization:
       - Configure the Flash ART accelerator on ITCM interface
       - Configure the Systick to generate an interrupt each 1 msec
       - Set NVIC Group Priority to 4
       - Global MSP (MCU Support Package) initialization
     */
  HAL_Init();



  /* Configure the system clock to 200 MHz */
  SystemClock_Config();
  //CPU_CACHE_Enable();

  RNG_Init();



  /* Initialize LCD and LEDs */
  BSP_Config();



  HAL_Delay(3000);


  /* Init thread */
#if defined(__GNUC__)
  osThreadDef(Start, StartThread, osPriorityNormal, 0, configMINIMAL_STACK_SIZE * 5);
#else
  osThreadDef(Start, StartThread, osPriorityNormal, 0, configMINIMAL_STACK_SIZE * 2);
#endif

  osThreadCreate (osThread(Start), NULL);




  osThreadDef(LED_task, StartLEDTask, osPriorityNormal, 0, 128); // osPriorityAboveNormal
    osThreadCreate(osThread(LED_task), NULL);


    HAL_Delay(4000);



  /* Start scheduler */
  osKernelStart();



  /* We should never get here as control is now taken by the scheduler */
  for( ;; );
}

/**
  * @brief  Start Thread
  * @param  argument not used
  * @retval None
  */

static void StartThread(void const * argument)
{


	/* Create tcp_ip stack thread */
  tcpip_init(NULL, NULL);

  /* Initialize the LwIP stack */
  Netif_Config();


  LCD_UsrLog(" Attente de l'assignation d'une adresse IP...\n");

      // Attente active de l'assignation IP (via DHCP ou statique)
      while (ready_to_show != 1) {
          osDelay(200);
      }

      LCD_UsrLog(" IP prête, lancement du client SSL\n");



   	     osThreadDef(CLIENT, SSL_Client, osPriorityRealtime, 0, configMINIMAL_STACK_SIZE * 10); //4096 configMINIMAL_STACK_SIZE * 5
   	     osThreadId sslClientHandle = osThreadCreate (osThread(CLIENT), NULL);

   	     // Vérification de la création
   	     if (sslClientHandle == NULL) {
   	         LCD_UsrLog("Erreur : thread SSL_Client non créé\n");
   	     } else {
   	         LCD_UsrLog("Thread SSL_Client créé avec succès\n");
   	     }


   	  while (g_calendar_ready == 0) {
   	          osDelay(100);
   	      }

   	      LCD_UsrLog("Calendrier prêt, fin du thread start\n");

   	      //Ajout

   	      osDelay(2000);

   	   	     	      BSP_LCD_Clear(LCD_COLOR_WHITE);
   	   	     	      BSP_LCD_SetTextColor(LCD_COLOR_BLUE);
   	   	     	      BSP_LCD_SetFont(&Font24);
   	   	     	      BSP_LCD_DisplayStringAt(0,LINE(5),(uint8_t *) "Planning de la salle 165",CENTER_MODE);
   	   	     	      BSP_LCD_DisplayStringAt(0,LINE(7),(uint8_t *) "Semaine du 9 au 13 juin 2025 ",CENTER_MODE);
   	   	     	      osDelay(4000);

   	   	     	      BSP_LCD_Clear(LCD_COLOR_WHITE);

   	   	     	      osDelay(100);
   	   	     	      osThreadDef(CALENDAR, Calendar_Display_Task, osPriorityNormal, 0, 1024);
   	   	     	     osThreadCreate(osThread(CALENDAR), NULL);

   	   	     	osDelay(3600000); // attndre 1h avant la premièr relance

  for( ;; )
  {

	  osThreadDef(CLIENT, SSL_Client, osPriorityRealtime, 0, configMINIMAL_STACK_SIZE * 10); //4096 configMINIMAL_STACK_SIZE * 5
	     	     osThreadId sslClientHandle = osThreadCreate (osThread(CLIENT), NULL);

	     	     // Vérification de la création
	     	     if (sslClientHandle == NULL) {
	     	         LCD_UsrLog("Erreur : thread SSL_Client non créé\n");
	     	     } else {
	     	         LCD_UsrLog("Thread SSL_Client créé avec succès\n");
	     	     }


	     	  while (g_calendar_ready == 0) {
	     	          osDelay(100);
	     	      }

	     	      LCD_UsrLog("Calendrier prêt, fin du thread start\n");

	     	      //Ajout

	     	      osDelay(2000);

	     	   	     	      BSP_LCD_Clear(LCD_COLOR_WHITE);
	     	   	     	      BSP_LCD_SetTextColor(LCD_COLOR_BLUE);
	     	   	     	      BSP_LCD_SetFont(&Font24);
	     	   	     	      BSP_LCD_DisplayStringAt(0,LINE(5),(uint8_t *) "Planning de la salle 165",CENTER_MODE);
	     	   	     	      BSP_LCD_DisplayStringAt(0,LINE(7),(uint8_t *) "Semaine du 9 au 13 juin 2025 ",CENTER_MODE);
	     	   	     	      osDelay(4000);

	     	   	     	      BSP_LCD_Clear(LCD_COLOR_WHITE);

	     	   	     	      osDelay(100);
	     	   	     	      osThreadDef(CALENDAR, Calendar_Display_Task, osPriorityNormal, 0, 1024);
	     	   	     	     osThreadCreate(osThread(CALENDAR), NULL);

	     	   	     	osDelay(3600000); // attndre 1h avant la prochaine relance
  }
}

/**
  * @brief  Initializes the lwIP stack
  * @param  None
  * @retval None
  */
static void Netif_Config(void)
{
  ip_addr_t ipaddr;
  ip_addr_t netmask;
  ip_addr_t gw;

#if LWIP_DHCP
  ip_addr_set_zero_ip4(&ipaddr);
  ip_addr_set_zero_ip4(&netmask);
  ip_addr_set_zero_ip4(&gw);
#else
  IP_ADDR4(&ipaddr,IP_ADDR0,IP_ADDR1,IP_ADDR2,IP_ADDR3);
  IP_ADDR4(&netmask,NETMASK_ADDR0,NETMASK_ADDR1,NETMASK_ADDR2,NETMASK_ADDR3);
  IP_ADDR4(&gw,GW_ADDR0,GW_ADDR1,GW_ADDR2,GW_ADDR3);
#endif /* LWIP_DHCP */

  /* add the network interface */
  netif_add(&gnetif_main, &ipaddr, &netmask, &gw, NULL, &ethernetif_init, &tcpip_input);

  /*  Registers the default network interface. */
  netif_set_default(&gnetif_main);

  ethernet_link_status_updated(&gnetif_main);

#if LWIP_NETIF_LINK_CALLBACK
  netif_set_link_callback(&gnetif_main, ethernet_link_status_updated);

  osThreadDef(EthLink, ethernet_link_thread, osPriorityNormal, 0, configMINIMAL_STACK_SIZE *2);
  osThreadCreate (osThread(EthLink), &gnetif_main);
#endif

#if LWIP_DHCP
  /* Start DHCPClient */
  osThreadDef(DHCP, DHCP_Thread, osPriorityBelowNormal, 0, configMINIMAL_STACK_SIZE * 2);
  osThreadCreate (osThread(DHCP), &gnetif_main);
#endif
}

/**
  * @brief  Initializes the STM327546G-Discovery's LCD  resources.
  * @param  None
  * @retval None
  */
static void BSP_Config(void)
{
#ifdef USE_LCD

    /* Initialize the LCD */
    BSP_LCD_Init();

    /* Initialize the LCD Layers */
  	BSP_LCD_LayerDefaultInit(1, LCD_FB_START_ADDRESS);



    /* Set LCD Foreground Layer  */
  	BSP_LCD_SelectLayer(1);

    BSP_LCD_SetFont(&LCD_DEFAULT_FONT);





    BSP_LCD_SetBackColor(LCD_COLOR_WHITE);
    BSP_LCD_SetTextColor(LCD_COLOR_BLACK);

  	//Clear screen to white
    BSP_LCD_Clear(LCD_COLOR_WHITE);

    //Display welcome message
    BSP_LCD_DisplayStringAt(0, BSP_LCD_GetYSize() / 2, (uint8_t *)"Bienvenue sur STM32", CENTER_MODE);


    HAL_Delay(4000);

    //Initialize LCD Log module //
    LCD_LOG_Init();


  //Show Header and Footer texts
    LCD_LOG_SetHeader((uint8_t *)"Client HTTPS - Emploi du temps ENSEA ADE");
    LCD_LOG_SetFooter((uint8_t *)"STM32746G-DISCO");

    LCD_UsrLog ((char *)"  State: Ethernet Initialization ...\n");




#else
  /* Configure LED1 and LED2 */
  BSP_LED_Init(LED1);
  BSP_LED_Init(LED2);

#endif /* USE_LCD */
}

/**
  * @brief  System Clock Configuration
  *         The system Clock is configured as follow :
  *            System Clock source            = PLL (HSE)
  *            SYSCLK(Hz)                     = 200000000
  *            HCLK(Hz)                       = 200000000
  *            AHB Prescaler                  = 1
  *            APB1 Prescaler                 = 4
  *            APB2 Prescaler                 = 2
  *            HSE Frequency(Hz)              = 25000000
  *            PLL_M                          = 25
  *            PLL_N                          = 432
  *            PLL_P                          = 2
  *            PLL_Q                          = 9
  *            VDD(V)                         = 3.3
  *            Main regulator output voltage  = Scale1 mode
  *            Flash Latency(WS)              = 7
  * @param  None
  * @retval None
  */
static void SystemClock_Config(void)
{
  RCC_ClkInitTypeDef RCC_ClkInitStruct;
  RCC_OscInitTypeDef RCC_OscInitStruct;

  __HAL_RCC_GPIOI_CLK_ENABLE();

  // 2. Configurer PI1 en mode sortie push-pull
  GPIO_InitTypeDef GPIO_InitStruct = {0};
  GPIO_InitStruct.Pin = GPIO_PIN_1;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;      // Mode sortie push-pull
  GPIO_InitStruct.Pull = GPIO_NOPULL;              // Pas de pull-up ni pull-down
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;     // Vitesse faible (suffisante pour une LED)
  HAL_GPIO_Init(GPIOI, &GPIO_InitStruct);



  /* Enable HSE Oscillator and activate PLL with HSE as source */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.HSIState = RCC_HSI_OFF;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLM = 25;
  RCC_OscInitStruct.PLL.PLLN = 400;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = 9;
  if(HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /* activate the OverDrive */
  if(HAL_PWREx_EnableOverDrive() != HAL_OK)
  {
    Error_Handler();
  }

  /* Select PLL as system clock source and configure the HCLK, PCLK1 and PCLK2
     clocks dividers */
  RCC_ClkInitStruct.ClockType = (RCC_CLOCKTYPE_SYSCLK | RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2);
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;
  if(HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_7) != HAL_OK)
  {
    Error_Handler();
  }
}


/**
  * @brief  This function is executed in case of error occurrence.
  * @param  None
  * @retval None
  */


/**
  * @brief  Configure the MPU attributes .
  * @param  None
  * @retval None
  */
static void MPU_Config(void)
{
  MPU_Region_InitTypeDef MPU_InitStruct;

  /* Disable the MPU */
  HAL_MPU_Disable();

  /* Configure the MPU as Strongly ordered for not defined regions */
  MPU_InitStruct.Enable = MPU_REGION_ENABLE;
  MPU_InitStruct.BaseAddress = 0x00;
  MPU_InitStruct.Size = MPU_REGION_SIZE_4GB;
  MPU_InitStruct.AccessPermission = MPU_REGION_NO_ACCESS;
  MPU_InitStruct.IsBufferable = MPU_ACCESS_NOT_BUFFERABLE;
  MPU_InitStruct.IsCacheable = MPU_ACCESS_NOT_CACHEABLE;
  MPU_InitStruct.IsShareable = MPU_ACCESS_SHAREABLE;
  MPU_InitStruct.Number = MPU_REGION_NUMBER0;
  MPU_InitStruct.TypeExtField = MPU_TEX_LEVEL0;
  MPU_InitStruct.SubRegionDisable = 0x87;
  MPU_InitStruct.DisableExec = MPU_INSTRUCTION_ACCESS_DISABLE;

  HAL_MPU_ConfigRegion(&MPU_InitStruct);

  /* Configure the MPU as Normal Non Cacheable for Ethernet Buffers in the SRAM2 */
  MPU_InitStruct.Enable = MPU_REGION_ENABLE;
  MPU_InitStruct.BaseAddress = 0x20048000;
  MPU_InitStruct.Size = MPU_REGION_SIZE_16KB;
  MPU_InitStruct.AccessPermission = MPU_REGION_FULL_ACCESS;
  MPU_InitStruct.IsBufferable = MPU_ACCESS_NOT_BUFFERABLE;
  MPU_InitStruct.IsCacheable = MPU_ACCESS_NOT_CACHEABLE;
  MPU_InitStruct.IsShareable = MPU_ACCESS_NOT_SHAREABLE;
  MPU_InitStruct.Number = MPU_REGION_NUMBER1;
  MPU_InitStruct.TypeExtField = MPU_TEX_LEVEL1;
  MPU_InitStruct.SubRegionDisable = 0x00;
  MPU_InitStruct.DisableExec = MPU_INSTRUCTION_ACCESS_ENABLE;

  HAL_MPU_ConfigRegion(&MPU_InitStruct);

  /* Configure the MPU as Device for Ethernet Descriptors in the SRAM2 */
  MPU_InitStruct.Enable = MPU_REGION_ENABLE;
  MPU_InitStruct.BaseAddress = 0x2004C000;
  MPU_InitStruct.Size = MPU_REGION_SIZE_1KB;
  MPU_InitStruct.AccessPermission = MPU_REGION_FULL_ACCESS;
  MPU_InitStruct.IsBufferable = MPU_ACCESS_BUFFERABLE;
  MPU_InitStruct.IsCacheable = MPU_ACCESS_NOT_CACHEABLE;
  MPU_InitStruct.IsShareable = MPU_ACCESS_SHAREABLE;
  MPU_InitStruct.Number = MPU_REGION_NUMBER2;
  MPU_InitStruct.TypeExtField = MPU_TEX_LEVEL0;
  MPU_InitStruct.SubRegionDisable = 0x00;
  MPU_InitStruct.DisableExec = MPU_INSTRUCTION_ACCESS_ENABLE;

  HAL_MPU_ConfigRegion(&MPU_InitStruct);

  /* Configure the MPU attributes as WT for SDRAM */
  MPU_InitStruct.Enable = MPU_REGION_ENABLE;
  MPU_InitStruct.BaseAddress = 0xC0000000;
  MPU_InitStruct.Size = MPU_REGION_SIZE_32MB;
  MPU_InitStruct.AccessPermission = MPU_REGION_FULL_ACCESS;
  MPU_InitStruct.IsBufferable = MPU_ACCESS_BUFFERABLE;
  MPU_InitStruct.IsCacheable = MPU_ACCESS_CACHEABLE;
  MPU_InitStruct.IsShareable = MPU_ACCESS_NOT_SHAREABLE;
  MPU_InitStruct.Number = MPU_REGION_NUMBER3;
  MPU_InitStruct.TypeExtField = MPU_TEX_LEVEL0;
  MPU_InitStruct.SubRegionDisable = 0x00;
  MPU_InitStruct.DisableExec = MPU_INSTRUCTION_ACCESS_ENABLE;

  HAL_MPU_ConfigRegion(&MPU_InitStruct);

  /* Configure the MPU attributes FMC control registers */
  MPU_InitStruct.Enable = MPU_REGION_ENABLE;
  MPU_InitStruct.BaseAddress = 0xA0000000;
  MPU_InitStruct.Size = MPU_REGION_SIZE_8KB;  //8KB
  MPU_InitStruct.AccessPermission = MPU_REGION_FULL_ACCESS;
  MPU_InitStruct.IsBufferable = MPU_ACCESS_NOT_BUFFERABLE;
  MPU_InitStruct.IsCacheable = MPU_ACCESS_NOT_CACHEABLE;
  MPU_InitStruct.IsShareable = MPU_ACCESS_SHAREABLE;
  MPU_InitStruct.Number = MPU_REGION_NUMBER4;
  MPU_InitStruct.TypeExtField = MPU_TEX_LEVEL0;
  MPU_InitStruct.SubRegionDisable = 0x0;
  MPU_InitStruct.DisableExec = MPU_INSTRUCTION_ACCESS_DISABLE;

  HAL_MPU_ConfigRegion(&MPU_InitStruct);

  /* Enable the MPU */
  HAL_MPU_Enable(MPU_PRIVILEGED_DEFAULT);
}

/**
  * @brief  CPU L1-Cache enable.
  * @param  None
  * @retval None
  */
static void CPU_CACHE_Enable(void)
{
  /* Enable I-Cache */
  SCB_EnableICache();

  /* Enable D-Cache */
  SCB_EnableDCache();
}

#ifdef  USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t* file, uint32_t line)
{
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
  while (1)
  {
  }
}
#endif





static void RNG_Init(void)
{
  RngHandle.Instance = RNG;

  __HAL_RCC_RNG_CLK_ENABLE();

  /* Initialize the RNG peripheral */
  if (HAL_RNG_Init(&RngHandle) != HAL_OK)
  {
    /* Initialization Error */
    Error_Handler();
  }
}




void Error_Handler(void)
{
	LCD_UsrLog ("error\n");

  while (1)
  {
  }
}
void Success_Handler(void)
{
    LCD_UsrLog ("success\n");

  while (1)
  {

  }
}






