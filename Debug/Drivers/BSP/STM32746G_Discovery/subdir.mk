################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/BSP/STM32746G_Discovery/stm32746g_discovery.c \
../Drivers/BSP/STM32746G_Discovery/stm32746g_discovery_lcd.c \
../Drivers/BSP/STM32746G_Discovery/stm32746g_discovery_sdram.c 

OBJS += \
./Drivers/BSP/STM32746G_Discovery/stm32746g_discovery.o \
./Drivers/BSP/STM32746G_Discovery/stm32746g_discovery_lcd.o \
./Drivers/BSP/STM32746G_Discovery/stm32746g_discovery_sdram.o 

C_DEPS += \
./Drivers/BSP/STM32746G_Discovery/stm32746g_discovery.d \
./Drivers/BSP/STM32746G_Discovery/stm32746g_discovery_lcd.d \
./Drivers/BSP/STM32746G_Discovery/stm32746g_discovery_sdram.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/STM32746G_Discovery/%.o Drivers/BSP/STM32746G_Discovery/%.su Drivers/BSP/STM32746G_Discovery/%.cyclo: ../Drivers/BSP/STM32746G_Discovery/%.c Drivers/BSP/STM32746G_Discovery/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F746NGHx -DSTM32F746G_DISCO -DSTM32F7 -c -I../Inc -I"C:/Users/faiss/Desktop/Projet_final/Application/ssl_client_inc" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/BSP/Components" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/BSP/STM32746G_Discovery" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/CMSIS/Include" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/STM32F7xx_HAL_Driver/Inc" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/FreeRTOS/include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/mbedTLS/include/mbedtls" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/mbedTLS/include" -I"C:/Users/faiss/Desktop/Projet_final/Application" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/CMSIS/Core/Include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/LwIP/include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/LwIP" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/FreeRTOS/portable" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-BSP-2f-STM32746G_Discovery

clean-Drivers-2f-BSP-2f-STM32746G_Discovery:
	-$(RM) ./Drivers/BSP/STM32746G_Discovery/stm32746g_discovery.cyclo ./Drivers/BSP/STM32746G_Discovery/stm32746g_discovery.d ./Drivers/BSP/STM32746G_Discovery/stm32746g_discovery.o ./Drivers/BSP/STM32746G_Discovery/stm32746g_discovery.su ./Drivers/BSP/STM32746G_Discovery/stm32746g_discovery_lcd.cyclo ./Drivers/BSP/STM32746G_Discovery/stm32746g_discovery_lcd.d ./Drivers/BSP/STM32746G_Discovery/stm32746g_discovery_lcd.o ./Drivers/BSP/STM32746G_Discovery/stm32746g_discovery_lcd.su ./Drivers/BSP/STM32746G_Discovery/stm32746g_discovery_sdram.cyclo ./Drivers/BSP/STM32746G_Discovery/stm32746g_discovery_sdram.d ./Drivers/BSP/STM32746G_Discovery/stm32746g_discovery_sdram.o ./Drivers/BSP/STM32746G_Discovery/stm32746g_discovery_sdram.su

.PHONY: clean-Drivers-2f-BSP-2f-STM32746G_Discovery

