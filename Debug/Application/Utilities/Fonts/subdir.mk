################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Application/Utilities/Fonts/font12.c \
../Application/Utilities/Fonts/font16.c \
../Application/Utilities/Fonts/font20.c \
../Application/Utilities/Fonts/font24.c \
../Application/Utilities/Fonts/font8.c 

OBJS += \
./Application/Utilities/Fonts/font12.o \
./Application/Utilities/Fonts/font16.o \
./Application/Utilities/Fonts/font20.o \
./Application/Utilities/Fonts/font24.o \
./Application/Utilities/Fonts/font8.o 

C_DEPS += \
./Application/Utilities/Fonts/font12.d \
./Application/Utilities/Fonts/font16.d \
./Application/Utilities/Fonts/font20.d \
./Application/Utilities/Fonts/font24.d \
./Application/Utilities/Fonts/font8.d 


# Each subdirectory must supply rules for building sources it contributes
Application/Utilities/Fonts/%.o Application/Utilities/Fonts/%.su Application/Utilities/Fonts/%.cyclo: ../Application/Utilities/Fonts/%.c Application/Utilities/Fonts/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F746NGHx -DSTM32F746G_DISCO -DSTM32F7 -c -I../Inc -I"C:/Users/faiss/Desktop/Projet_final/Application/ssl_client_inc" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/BSP/Components" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/BSP/STM32746G_Discovery" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/CMSIS/Include" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/STM32F7xx_HAL_Driver/Inc" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/FreeRTOS/include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/mbedTLS/include/mbedtls" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/mbedTLS/include" -I"C:/Users/faiss/Desktop/Projet_final/Application" -I"C:/Users/faiss/Desktop/Projet_final/Drivers/CMSIS/Core/Include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/LwIP/include" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/LwIP" -I"C:/Users/faiss/Desktop/Projet_final/Middlewares/FreeRTOS/portable" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Application-2f-Utilities-2f-Fonts

clean-Application-2f-Utilities-2f-Fonts:
	-$(RM) ./Application/Utilities/Fonts/font12.cyclo ./Application/Utilities/Fonts/font12.d ./Application/Utilities/Fonts/font12.o ./Application/Utilities/Fonts/font12.su ./Application/Utilities/Fonts/font16.cyclo ./Application/Utilities/Fonts/font16.d ./Application/Utilities/Fonts/font16.o ./Application/Utilities/Fonts/font16.su ./Application/Utilities/Fonts/font20.cyclo ./Application/Utilities/Fonts/font20.d ./Application/Utilities/Fonts/font20.o ./Application/Utilities/Fonts/font20.su ./Application/Utilities/Fonts/font24.cyclo ./Application/Utilities/Fonts/font24.d ./Application/Utilities/Fonts/font24.o ./Application/Utilities/Fonts/font24.su ./Application/Utilities/Fonts/font8.cyclo ./Application/Utilities/Fonts/font8.d ./Application/Utilities/Fonts/font8.o ./Application/Utilities/Fonts/font8.su

.PHONY: clean-Application-2f-Utilities-2f-Fonts

