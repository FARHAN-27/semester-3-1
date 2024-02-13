#include<stdio.h>
#include <stdint.h>
#include "CLOCK.h"
#include "RCC.h"
#include "GPIO.h"

#define OUT_PIN  5
#define IN_PIN  1

int main(void)
{
	initClock();

	uint32_t *RCC_AHB1ENR = (uint32_t*) &RCC->AHB1ENR;
	uint32_t *GPIOA_MODER = (uint32_t*) &GPIOA->MODER;

	*RCC_AHB1ENR |= (1 << 0);
	*GPIOA_MODER |= (1 << (2 * OUT_PIN));

	while(1)
	{
		uint32_t *GPIOA_IDR = (uint32_t*) &GPIOA->IDR;	
		uint32_t *GPIOA_OUT = (uint32_t*) &GPIOA->ODR;
		int a = *GPIOA_IDR & (1 << IN_PIN);

		if (a)
			*GPIOA_OUT |= (1 << OUT_PIN);
		else
			*GPIOA_OUT &= ~(1 << OUT_PIN);		
	}



}
