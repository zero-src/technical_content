#include <stdio.h>

int main(){

    long number;
    float x;

    x = 3.14;
    number = *(long)&x;

    printf("new nubmer: %d", number);

    return 0;
}