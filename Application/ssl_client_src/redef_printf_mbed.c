/*
 * redef_printf_mbed.c
 *
 *  Created on: Jun 3, 2025
 *      Author: faiss
 */


#include <stdio.h>
#include <stdarg.h>
#include <string.h>
#include "lcd_log.h"

void ssl_log(const char *fmt, ...)
{
    char buf[256];
    va_list args;
    va_start(args, fmt);
    vsnprintf(buf, sizeof(buf), fmt, args);
    va_end(args);

    LCD_LineColor = LCD_LOG_TEXT_COLOR;
    LCD_UsrLog("%s", buf);  // Ou autre fonction de log LCD
}
