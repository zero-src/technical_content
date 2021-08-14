# Contents 🚀
- [Float to number](#float-to-number)

## Float to number
```c
#include <stdio.h>

int main(){

    long number;
    float x;

    x = 3.14;
    number = *(long)&x;

    printf("new nubmer: %d", number);

    return 0;
}
```
[Back to TOC](#contents-)