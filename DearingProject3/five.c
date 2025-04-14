#include<stdio.h>
#include<stdlib.h>

/*
 * This one won't print a success message.  You just have to prevent it
 * from printing the no-success message.  Try to find an early exit!
 */

int main(){

    asm("mov $0, %edi;"
        "call exit"
        );

    printf("I'm still here!  Keep trying!\n");
    return 0;
}
