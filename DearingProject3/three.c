#include<stdio.h>
#include<time.h>

/*
 * This time, your assembly code is timed!  It must take longer than 10 seconds.
 */

int main(){
    time_t start_time = time(0);

    asm("mov $1000000000, %%rcx\n\t"    // Load RCX with the loop counter
        "loop:"
        "pause\n\t"                      // Pause instruction in a loop
        "dec %%rcx\n\t"                  // Decrement the loop counter
        "jnz loop\n\t"                   // Jump to the start of the loop if RCX is not zero
        :
        :
        : "rcx"                          // Clobbered register
    );

    time_t end_time = time(0);
    if(end_time - start_time > 10)
        printf("You finished problem three!\n");
    else
        printf("Keep trying!\n");

    return 0;
}
