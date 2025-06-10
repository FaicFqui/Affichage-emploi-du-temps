################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Application/User/app_ethernet.c \
../Application/User/ethernetif.c \
../Application/User/main.c \
../Application/User/stm32f7xx_hal_timebase_tim.c \
../Application/User/stm32f7xx_it.c 

OBJS += \
./Application/User/app_ethernet.o \
./Application/User/ethernetif.o \
./Application/User/main.o \
./Application/User/stm32f7xx_hal_timebase_tim.o \
./Application/User/stm32f7xx_it.o 

C_DEPS += \
./Application/User/app_ethernet.d \
./Application/User/ethernetif.d \
./Application/User/main.d \
./Application/User/stm32f7xx_hal_timebase_tim.d \
./Application/User/stm32f7xx_it.d 


# Each subdirectory must supply rules for building sources it contributes
Application/User/%.o Application/User/%.su Application/User/%.cyclo: ../Application/User/%.c Application/User/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F746NGHx -DSTM32F746G_DISCO -DSTM32F7 -c -I../Inc -I"C:/Users/faiss/Desktop/Projet_final/Application/ssl_client_inc" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/BSP/Components" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/BSP/STM32746G_Discovery" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/CMSIS/Include" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/STM32F7xx_HAL_Driver/Inc" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/FreeRTOS/include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/mbedTLS/include/mbedtls" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/mbedTLS/include" -I"C:/Users/faiss/Desktop/Projet_final/Application" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/CMSIS/Core/Include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/LwIP/include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/LwIP" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/FreeRTOS/portable" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Application-2f-User

clean-Application-2f-User:
	-$(RM) ./Application/User/app_ethernet.cyclo ./Application/User/app_ethernet.d ./Application/User/app_ethernet.o ./Application/User/app_ethernet.su ./Application/User/ethernetif.cyclo ./Application/User/ethernetif.d ./Application/User/ethernetif.o ./Application/User/ethernetif.su ./Application/User/main.cyclo ./Application/User/main.d ./Application/User/main.o ./Application/User/main.su ./Application/User/stm32f7xx_hal_timebase_tim.cyclo ./Application/User/stm32f7xx_hal_timebase_tim.d ./Application/User/stm32f7xx_hal_timebase_tim.o ./Application/User/stm32f7xx_hal_timebase_tim.su ./Application/User/stm32f7xx_it.cyclo ./Application/User/stm32f7xx_it.d ./Application/User/stm32f7xx_it.o ./Application/User/stm32f7xx_it.su

.PHONY: clean-Application-2f-User

