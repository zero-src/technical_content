# Contents 🚀
- [Struct](#struct)
    - [Example](#example)
    - [Private / Public methods](#private--public-methods)

## Struct

### Example
```cpp
#include <iostream>

struct str_complex {
    double re, im;

    double cpp_mult()
    { 
        return sqrt(re * re + im * im); 
    }

    double cpp_mult_this()
    {
        return sqrt(this->re * this->re + this->im * this->im);
    }
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

### Private / Public methods
```cpp
#include <iostream>
#include <tuple>

struct str_complex {
private:
    double re, im;

public:
    str_complex(double new_re, double new_im)
    {
        re = new_re;
        im = new_im;
    }

    std::tuple<double, double> get()
    {
        return std::make_tuple(re, im);
    }
};

int main()
{
    str_complex clx(2.7, 3.8);
    double clx_re, clx_im;

    // C++14 structured binding:
    std::tie(clx_re, clx_im) = clx.get();

    // C++17 structured binding:
    auto [struct_re, struct_im] = clx.get();
    
    std::cout   << "\n[clx_re, clx_im]: " << clx_re << " " << clx_im
                << "\n[struct_re, struct_im]: " << struct_re << " " << struct_im
                << std::endl;

    //[clx_re, clx_im] : 2.7 3.8
    //[struct_re, struct_im] : 2.7 3.8

    return 0;
}
```
[Back to TOC](#contents-)