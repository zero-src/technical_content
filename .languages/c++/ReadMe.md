# Contents 🚀
- [Struct](#struct)
    -[Default struct](#default-struct)

## Struct

### Default struct
```cpp
#include <iostream>

struct str_complex {
    double re, im;

    double cpp_mult()
    { 
        return sqrt(re * re + im * im); 
    };

    double cpp_mult_this()
    {
        return sqrt(this->re * this->re + this->im * this->im);
    };
};

int main()
{
    str_complex clx;
    double res, res_this;

    clx.re = 2.7;
    clx.im = 3.8;

    res = clx.cpp_mult();
    res_this = clx.cpp_mult_this();
    
    std::cout << "res: " << res << "\nres_this: " << res_this << std::endl;

    //res: 4.66154
    //res_this: 4.66154

    return 0;
}
```
[Back to TOC](#contents-)