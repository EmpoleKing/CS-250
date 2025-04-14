#include<stdio.h>

size_t string_length(char*);

int main(){
    char *testphrase = "Beanie Babies";
    printf("Testphrase:  %s\n", testphrase);
    printf("Length:  %d\n", string_length(testphrase));
    return 0;
}
