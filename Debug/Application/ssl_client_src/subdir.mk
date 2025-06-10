################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Application/ssl_client_src/aes_alt.c \
../Application/ssl_client_src/hardware_rng.c \
../Application/ssl_client_src/lwip.c \
../Application/ssl_client_src/net_sockets.c \
../Application/ssl_client_src/redef_printf_mbed.c \
../Application/ssl_client_src/ssl_client.c 

OBJS += \
./Application/ssl_client_src/aes_alt.o \
./Application/ssl_client_src/hardware_rng.o \
./Application/ssl_client_src/lwip.o \
./Application/ssl_client_src/net_sockets.o \
./Application/ssl_client_src/redef_printf_mbed.o \
./Application/ssl_client_src/ssl_client.o 

C_DEPS += \
./Application/ssl_client_src/aes_alt.d \
./Application/ssl_client_src/hardware_rng.d \
./Application/ssl_client_src/lwip.d \
./Application/ssl_client_src/net_sockets.d \
./Application/ssl_client_src/redef_printf_mbed.d \
./Application/ssl_client_src/ssl_client.d 


# Each subdirectory must supply rules for building sources it contributes
Application/ssl_client_src/%.o Application/ssl_client_src/%.su Application/ssl_client_src/%.cyclo: ../Application/ssl_client_src/%.c Application/ssl_client_src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F746NGHx -DSTM32F746G_DISCO -DSTM32F7 -c -I../Inc -I"C:/Users/faiss/Desktop/Projet_final/Application/ssl_client_inc" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/BSP/Components" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/BSP/STM32746G_Discovery" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/CMSIS/Include" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/STM32F7xx_HAL_Driver/Inc" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/FreeRTOS/include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/mbedTLS/include/mbedtls" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/mbedTLS/include" -I"C:/Users/faiss/Desktop/Projet_final/Application" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/CMSIS/Core/Include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/LwIP/include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/LwIP" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/FreeRTOS/portable" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Application-2f-ssl_client_src

clean-Application-2f-ssl_client_src:
	-$(RM) ./Application/ssl_client_src/aes_alt.cyclo ./Application/ssl_client_src/aes_alt.d ./Application/ssl_client_src/aes_alt.o ./Application/ssl_client_src/aes_alt.su ./Application/ssl_client_src/hardware_rng.cyclo ./Application/ssl_client_src/hardware_rng.d ./Application/ssl_client_src/hardware_rng.o ./Application/ssl_client_src/hardware_rng.su ./Application/ssl_client_src/lwip.cyclo ./Application/ssl_client_src/lwip.d ./Application/ssl_client_src/lwip.o ./Application/ssl_client_src/lwip.su ./Application/ssl_client_src/net_sockets.cyclo ./Application/ssl_client_src/net_sockets.d ./Application/ssl_client_src/net_sockets.o ./Application/ssl_client_src/net_sockets.su ./Application/ssl_client_src/redef_printf_mbed.cyclo ./Application/ssl_client_src/redef_printf_mbed.d ./Application/ssl_client_src/redef_printf_mbed.o ./Application/ssl_client_src/redef_printf_mbed.su ./Application/ssl_client_src/ssl_client.cyclo ./Application/ssl_client_src/ssl_client.d ./Application/ssl_client_src/ssl_client.o ./Application/ssl_client_src/ssl_client.su

.PHONY: clean-Application-2f-ssl_client_src

