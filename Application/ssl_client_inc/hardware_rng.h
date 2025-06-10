/*
 * hardware_rng.h
 *
 *  Created on: Mai, 2025
 *      Author: Faiçal FQUIHI
 */

#ifndef FSOURCES_HARDWARE_RNG_H_
#define FSOURCES_HARDWARE_RNG_H_



#include <stddef.h>

int mbedtls_hardware_poll(void *data, unsigned char *output, size_t len, size_t *olen);




#endif /* FSOURCES_HARDWARE_RNG_H_ */
