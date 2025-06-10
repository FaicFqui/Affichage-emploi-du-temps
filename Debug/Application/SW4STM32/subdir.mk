################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Application/SW4STM32/syscalls.c 

OBJS += \
./Application/SW4STM32/syscalls.o 

C_DEPS += \
./Application/SW4STM32/syscalls.d 


# Each subdirectory must supply rules for building sources it contributes
Application/SW4STM32/%.o Application/SW4STM32/%.su Application/SW4STM32/%.cyclo: ../Application/SW4STM32/%.c Application/SW4STM32/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F746NGHx -DSTM32F746G_DISCO -DSTM32F7 -c -I../Inc -I"C:/Users/faiss/Desktop/Projet_final/Application/ssl_client_inc" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/BSP/Components" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/BSP/STM32746G_Discovery" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/CMSIS/Include" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/STM32F7xx_HAL_Driver/Inc" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/FreeRTOS/include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/mbedTLS/include/mbedtls" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/mbedTLS/include" -I"C:/Users/faiss/Desktop/Projet_final/Application" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/CMSIS/Core/Include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/LwIP/include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/LwIP" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/FreeRTOS/portable" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Application-2f-SW4STM32

clean-Application-2f-SW4STM32:
	-$(RM) ./Application/SW4STM32/syscalls.cyclo ./Application/SW4STM32/syscalls.d ./Application/SW4STM32/syscalls.o ./Application/SW4STM32/syscalls.su

.PHONY: clean-Application-2f-SW4STM32

