#include <stdio.h>

/*
 * Make calc_value return the square of its parameter.
 * You can figure out how to use "mul", or write a loop and use addition.
 */

volatile int calc_value(int a){
    int c;

    asm(
        "movl %1, %%eax      \n\t"  // Move parameter a to eax register
        "imull %1, %%eax     \n\t"  // Multiply eax by itself (a * a)
        "movl %%eax, %0      \n\t"  // Move result to variable c
        : "=r" (c)                  // Output: c
        : "r" (a)                   // Input: a
        : "%eax"                    // Clobbered register
       );

    return c;
}

int main(){
    if(calc_value(5) == 25 && calc_value(12) == 144)
        printf("You finished problem two!\n");
    else
        printf("Keep trying!\n");
    return 0;
}
