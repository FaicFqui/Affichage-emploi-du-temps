/**
  ******************************************************************************
  * @file    LwIP/LwIP_HTTP_Server_Netconn_RTOS/Inc/main.h 
  * @author  MCD Application Team
  * @brief   Header for main.c module
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2016 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f7xx_hal.h"
#include "stm32746g_discovery.h"
#include "stm32746g_discovery_lcd.h"

/* Exported types ------------------------------------------------------------*/
/* Exported constants --------------------------------------------------------*/ 
#define USE_DHCP       /* enable DHCP, if disabled static address is used*/
#define USE_LCD

/*Static IP ADDRESS*/
#define IP_ADDR0   192
#define IP_ADDR1   168
#define IP_ADDR2   0
#define IP_ADDR3   10
   
/*NETMASK*/
#define NETMASK_ADDR0   255
#define NETMASK_ADDR1   255
#define NETMASK_ADDR2   255
#define NETMASK_ADDR3   0

/*Gateway Address*/
#define GW_ADDR0   192
#define GW_ADDR1   168
#define GW_ADDR2   0
#define GW_ADDR3   1 





#define GET_REQUEST  "GET /jsp/custom/modules/plannings/anonymous_cal.jsp?resources=208&projectId=15&calType=ical&nbWeeks=4 HTTP/1.1\r\n" \
		"Host: ade.ensea.fr\r\n" \
		"Connection: close\r\n\r\n"
#define SERVER_PORT  "443"
#define SERVER_NAME "ade.ensea.fr"

extern volatile uint8_t ssl_done;

/* Exported macro ------------------------------------------------------------*/
/* Exported functions ------------------------------------------------------- */  



extern volatile uint8_t ready_to_show;

extern struct netif gnetif_main;

void Error_Handler(void);
void Success_Handler(void);
void LVGL_test_display_test(void);



#define DEBUT 1


#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */


