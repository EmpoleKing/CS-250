#include<stdio.h>

/*
 * Now, your assembly code will be called in a loop!
 * Be sure to not let the condition inside the loop be true!
 */

size_t count = 5;

void dec(){
    asm(""
        );
}

int main(){
    int i;
    for(i = 5; i > 0; i--){
        if(i != count){
            printf("Keep Trying!\n");
            return 0;
        }
        else 
            printf(".");
        dec();
    }
    printf("You solved problem nine!\n");

    return 0;
}
