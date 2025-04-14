#include<stdio.h>

/* This is a tricky one.
 * You can't make this condition false!  You'll have to jump over it.
 * jmp supports arithmatic.  You can jmp to main+something, but you'll
 * have to figure out "something" by using disassemble in the debugger,
 * and it will change when you add assembly code!
 */

int main(){
    int low = 0;

    asm("jmp main+0x7FF7"
        );

    low = 0;
    if(low < 0xFFFFFFFF){
        printf("Keep Trying!\n");
        return 0;
    }
    printf("You finished problem six!\n");
    return 0;
}
