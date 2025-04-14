#include<stdio.h>

/*
 * x must equal main.  But how does main look in assembly?
 */

int main(){
    void* x;

    asm(""
        );

    if(main == x)
        printf("You solved problem 10!\n");
    else
        printf("Keep trying!\n");
}
