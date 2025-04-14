#include<stdio.h>

/* 
 * Set the values of a, b, and c.
 */

int main(){
    int a, b, c;

    asm(
        "movl $17, %0    \n\t"  // Set a = 17
        "movl $9, %1     \n\t"  // Set b = 9
        "movl $100, %2   \n\t"  // Set c = 100
        : "=r" (a), "=r" (b), "=r" (c)  // Output operands
        :                            // No input operands
        :                            // No clobbered registers
    );

    if(a == 17 && b == 9 && c == 100)
        printf("You finished problem one!\n");
    else
        printf("Not yet, keep going!\n");
    return 0;
}
