################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/Users/faiss/Desktop/lwip_serveur/STM32CubeF7/Middlewares/Third_Party/FreeRTOS/Source/croutine.c \
C:/Users/faiss/Desktop/lwip_serveur/STM32CubeF7/Middlewares/Third_Party/FreeRTOS/Source/list.c \
C:/Users/faiss/Desktop/lwip_serveur/STM32CubeF7/Middlewares/Third_Party/FreeRTOS/Source/queue.c \
C:/Users/faiss/Desktop/lwip_serveur/STM32CubeF7/Middlewares/Third_Party/FreeRTOS/Source/tasks.c \
C:/Users/faiss/Desktop/lwip_serveur/STM32CubeF7/Middlewares/Third_Party/FreeRTOS/Source/timers.c 

OBJS += \
./Middlewares/FreeRTOS/croutine.o \
./Middlewares/FreeRTOS/list.o \
./Middlewares/FreeRTOS/queue.o \
./Middlewares/FreeRTOS/tasks.o \
./Middlewares/FreeRTOS/timers.o 

C_DEPS += \
./Middlewares/FreeRTOS/croutine.d \
./Middlewares/FreeRTOS/list.d \
./Middlewares/FreeRTOS/queue.d \
./Middlewares/FreeRTOS/tasks.d \
./Middlewares/FreeRTOS/timers.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/FreeRTOS/croutine.o: C:/Users/faiss/Desktop/lwip_serveur/STM32CubeF7/Middlewares/Third_Party/FreeRTOS/Source/croutine.c Middlewares/FreeRTOS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F746NGHx -DSTM32F746G_DISCO -DSTM32F7 -c -I../Inc -I"C:/Users/faiss/Desktop/Projet_final/Application/ssl_client_inc" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/BSP/Components" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/BSP/STM32746G_Discovery" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/CMSIS/Include" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/STM32F7xx_HAL_Driver/Inc" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/FreeRTOS/include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/mbedTLS/include/mbedtls" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/mbedTLS/include" -I"C:/Users/faiss/Desktop/Projet_final/Application" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/CMSIS/Core/Include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/LwIP/include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/LwIP" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/FreeRTOS/portable" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/FreeRTOS/list.o: C:/Users/faiss/Desktop/lwip_serveur/STM32CubeF7/Middlewares/Third_Party/FreeRTOS/Source/list.c Middlewares/FreeRTOS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F746NGHx -DSTM32F746G_DISCO -DSTM32F7 -c -I../Inc -I"C:/Users/faiss/Desktop/Projet_final/Application/ssl_client_inc" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/BSP/Components" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/BSP/STM32746G_Discovery" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/CMSIS/Include" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/STM32F7xx_HAL_Driver/Inc" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/FreeRTOS/include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/mbedTLS/include/mbedtls" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/mbedTLS/include" -I"C:/Users/faiss/Desktop/Projet_final/Application" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/CMSIS/Core/Include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/LwIP/include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/LwIP" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/FreeRTOS/portable" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/FreeRTOS/queue.o: C:/Users/faiss/Desktop/lwip_serveur/STM32CubeF7/Middlewares/Third_Party/FreeRTOS/Source/queue.c Middlewares/FreeRTOS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F746NGHx -DSTM32F746G_DISCO -DSTM32F7 -c -I../Inc -I"C:/Users/faiss/Desktop/Projet_final/Application/ssl_client_inc" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/BSP/Components" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/BSP/STM32746G_Discovery" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/CMSIS/Include" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/STM32F7xx_HAL_Driver/Inc" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/FreeRTOS/include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/mbedTLS/include/mbedtls" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/mbedTLS/include" -I"C:/Users/faiss/Desktop/Projet_final/Application" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/CMSIS/Core/Include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/LwIP/include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/LwIP" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/FreeRTOS/portable" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/FreeRTOS/tasks.o: C:/Users/faiss/Desktop/lwip_serveur/STM32CubeF7/Middlewares/Third_Party/FreeRTOS/Source/tasks.c Middlewares/FreeRTOS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F746NGHx -DSTM32F746G_DISCO -DSTM32F7 -c -I../Inc -I"C:/Users/faiss/Desktop/Projet_final/Application/ssl_client_inc" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/BSP/Components" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/BSP/STM32746G_Discovery" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/CMSIS/Include" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/STM32F7xx_HAL_Driver/Inc" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/FreeRTOS/include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/mbedTLS/include/mbedtls" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/mbedTLS/include" -I"C:/Users/faiss/Desktop/Projet_final/Application" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/CMSIS/Core/Include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/LwIP/include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/LwIP" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/FreeRTOS/portable" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Middlewares/FreeRTOS/timers.o: C:/Users/faiss/Desktop/lwip_serveur/STM32CubeF7/Middlewares/Third_Party/FreeRTOS/Source/timers.c Middlewares/FreeRTOS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F746NGHx -DSTM32F746G_DISCO -DSTM32F7 -c -I../Inc -I"C:/Users/faiss/Desktop/Projet_final/Application/ssl_client_inc" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/BSP/Components" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/BSP/STM32746G_Discovery" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/CMSIS/Include" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/STM32F7xx_HAL_Driver/Inc" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/FreeRTOS/include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/mbedTLS/include/mbedtls" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/mbedTLS/include" -I"C:/Users/faiss/Desktop/Projet_final/Application" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/CMSIS/Core/Include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/LwIP/include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/LwIP" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/FreeRTOS/portable" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-FreeRTOS

clean-Middlewares-2f-FreeRTOS:
	-$(RM) ./Middlewares/FreeRTOS/croutine.cyclo ./Middlewares/FreeRTOS/croutine.d ./Middlewares/FreeRTOS/croutine.o ./Middlewares/FreeRTOS/croutine.su ./Middlewares/FreeRTOS/list.cyclo ./Middlewares/FreeRTOS/list.d ./Middlewares/FreeRTOS/list.o ./Middlewares/FreeRTOS/list.su ./Middlewares/FreeRTOS/queue.cyclo ./Middlewares/FreeRTOS/queue.d ./Middlewares/FreeRTOS/queue.o ./Middlewares/FreeRTOS/queue.su ./Middlewares/FreeRTOS/tasks.cyclo ./Middlewares/FreeRTOS/tasks.d ./Middlewares/FreeRTOS/tasks.o ./Middlewares/FreeRTOS/tasks.su ./Middlewares/FreeRTOS/timers.cyclo ./Middlewares/FreeRTOS/timers.d ./Middlewares/FreeRTOS/timers.o ./Middlewares/FreeRTOS/timers.su

.PHONY: clean-Middlewares-2f-FreeRTOS

