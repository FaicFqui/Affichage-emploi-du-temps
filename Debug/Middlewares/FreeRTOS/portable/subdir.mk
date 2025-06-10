################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/faiss/Desktop/lwip_serveur/STM32CubeF7/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS/cmsis_os.c \
C:/Users/faiss/Desktop/lwip_serveur/STM32CubeF7/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/heap_4.c \
C:/Users/faiss/Desktop/lwip_serveur/STM32CubeF7/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1/port.c 

OBJS += \
./Middlewares/FreeRTOS/portable/cmsis_os.o \
./Middlewares/FreeRTOS/portable/heap_4.o \
./Middlewares/FreeRTOS/portable/port.o 

C_DEPS += \
./Middlewares/FreeRTOS/portable/cmsis_os.d \
./Middlewares/FreeRTOS/portable/heap_4.d \
./Middlewares/FreeRTOS/portable/port.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/FreeRTOS/portable/cmsis_os.o: C:/Users/faiss/Desktop/lwip_serveur/STM32CubeF7/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS/cmsis_os.c Middlewares/FreeRTOS/portable/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F746NGHx -DSTM32F746G_DISCO -DSTM32F7 -c -I../Inc -I"C:/Users/faiss/Desktop/Projet_final/Application/ssl_client_inc" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/BSP/Components" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/BSP/STM32746G_Discovery" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/CMSIS/Include" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/STM32F7xx_HAL_Driver/Inc" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/FreeRTOS/include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/mbedTLS/include/mbedtls" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/mbedTLS/include" -I"C:/Users/faiss/Desktop/Projet_final/Application" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/CMSIS/Core/Include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/LwIP/include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/LwIP" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/FreeRTOS/portable" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/FreeRTOS/portable/heap_4.o: C:/Users/faiss/Desktop/lwip_serveur/STM32CubeF7/Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/heap_4.c Middlewares/FreeRTOS/portable/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F746NGHx -DSTM32F746G_DISCO -DSTM32F7 -c -I../Inc -I"C:/Users/faiss/Desktop/Projet_final/Application/ssl_client_inc" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/BSP/Components" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/BSP/STM32746G_Discovery" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/CMSIS/Include" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/STM32F7xx_HAL_Driver/Inc" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/FreeRTOS/include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/mbedTLS/include/mbedtls" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/mbedTLS/include" -I"C:/Users/faiss/Desktop/Projet_final/Application" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/CMSIS/Core/Include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/LwIP/include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/LwIP" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/FreeRTOS/portable" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/FreeRTOS/portable/port.o: C:/Users/faiss/Desktop/lwip_serveur/STM32CubeF7/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1/port.c Middlewares/FreeRTOS/portable/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F746NGHx -DSTM32F746G_DISCO -DSTM32F7 -c -I../Inc -I"C:/Users/faiss/Desktop/Projet_final/Application/ssl_client_inc" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/BSP/Components" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/BSP/STM32746G_Discovery" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/CMSIS/Include" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/STM32F7xx_HAL_Driver/Inc" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/FreeRTOS/include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/mbedTLS/include/mbedtls" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/mbedTLS/include" -I"C:/Users/faiss/Desktop/Projet_final/Application" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/CMSIS/Core/Include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/LwIP/include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/LwIP" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/FreeRTOS/portable" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-FreeRTOS-2f-portable

clean-Middlewares-2f-FreeRTOS-2f-portable:
	-$(RM) ./Middlewares/FreeRTOS/portable/cmsis_os.cyclo ./Middlewares/FreeRTOS/portable/cmsis_os.d ./Middlewares/FreeRTOS/portable/cmsis_os.o ./Middlewares/FreeRTOS/portable/cmsis_os.su ./Middlewares/FreeRTOS/portable/heap_4.cyclo ./Middlewares/FreeRTOS/portable/heap_4.d ./Middlewares/FreeRTOS/portable/heap_4.o ./Middlewares/FreeRTOS/portable/heap_4.su ./Middlewares/FreeRTOS/portable/port.cyclo ./Middlewares/FreeRTOS/portable/port.d ./Middlewares/FreeRTOS/portable/port.o ./Middlewares/FreeRTOS/portable/port.su

.PHONY: clean-Middlewares-2f-FreeRTOS-2f-portable

