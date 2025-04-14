#include<stdio.h>

/*
 * This won't print anything at all when you start.
 * Call foo with a parameter of 172 to win!
 */

void foo(unsigned long int x){
    if(x == 172)
        printf("You finished problem eight!\n");
    else
        printf("Keep trying!\n");
}

int main(){

    asm("mov $172, %%rdi;"
        "call %P0"
        :
        : "i" (foo)
        : "rdi", "rax");

    return 0;
}
