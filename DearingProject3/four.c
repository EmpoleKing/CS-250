#include<stdio.h>
#include<unistd.h>
#include<time.h>

/*
 * This time, your assembly code must be faster than fast!
 * But there are always other ways to win.  Remember, your assembly
 * code can change any variable in the program.
 */

int main(){
    time_t start_time = time(0);

    asm("mov $-1, %0"
        : "=r"(start_time)
        :
        : );

    time_t end_time = time(0);
    if(end_time < start_time)
        printf("You finished problem four!\n");
    else
        printf("Keep Trying!\n");
    return 0;
}
