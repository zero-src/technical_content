# Contents 🚀
- [Structs](#structs)
    - [Example](#example)
    - [Private / Public methods](#private--public-methods)
- [Classes](#classes)
    - [Initialisation](#initialisation)
- [Overload](#overloaded-operators)
- [Reference](#reference)
- [Inline](#inline)
- [Extern](#extern)

## Structs

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
    
    /*
    // This code dose the same as code above
    double clx_re, clx_im;

    // C++14 structured binding:
    std::tie(clx_re, clx_im) = str_complex(2.7, 3.8).get();

    // C++17 structured binding:
    auto [struct_re, struct_im] = str_complex(2.7, 3.8).get();
    */

    std::cout   << "\n[clx_re, clx_im]: " << clx_re << " " << clx_im
                << "\n[struct_re, struct_im]: " << struct_re << " " << struct_im
                << std::endl;

    //[clx_re, clx_im] : 2.7 3.8
    //[struct_re, struct_im] : 2.7 3.8

    return 0;
}
```
[Back to TOC](#contents-)

## Classes

### Initialisation
```cpp
#include <iostream>

class Complex {
    double re, im;

public:
    Complex(double a_re, double a_im) { re = a_re; im = a_im; }

    double GetRe()      { return re; }
    double GetIm()      { return im; }
    double Modulo()     { return sqrt(re * re + im * im); }
    double Argument()   { return atan2(im, re); }

    // Destructor (works after object destruction)
    ~Complex() { 
        if (re != 0 || im != 0) 
        { 
            re = im = 0; 
        } 
    }
};

int main()
{
    double re, im, mod, arg;

    /*
    re = Complex(2.7, 3.8).GetRe();
    im = Complex(2.7, 3.8).GetIm();
    mod = Complex(2.7, 3.8).Modulo();
    arg = Complex(2.7, 3.8).Argument();
    */

    Complex clx(2.7, 3.8);

    re = clx.GetRe();
    im = clx.GetIm();
    mod = clx.Modulo();
    arg = clx.Argument();

    return 0;
}
```
[Back to TOC](#contents-)

## Reference
>References are not objects; they do not necessarily occupy storage, although the compiler may allocate storage if it is necessary to implement the desired semantics (e.g. a non-static data member of reference type usually increases the size of the class by the amount necessary to store a memory address).

```cpp
int main()
{
    int number(10);
    int& ref_number = number;

    number = 11;
    std::cout << ref_number << std::endl; // 11

    ref_number = 10;
    std::cout << number << std::endl; // 10

    return 0;
}
```

[Back to TOC](#contents-)

## Overloaded operators
```cpp
#include <iostream>

class Complex {
    double re, im;

public:
    Complex(double a_re, double a_im) { re = a_re; im = a_im; }
    Complex() { re = 0; im = 0; } // Now initialization is overloaded

    double GetRe()      { return re; }
    double GetIm()      { return im; }
    double Modulo()     { return sqrt(re * re + im * im); }
    double Argument()   { return atan2(im, re); }

    // Overloaded "+" operator
    Complex operator+(Complex expr)
    {
        Complex res(re + expr.re, im + expr.im);
        return res;
    }

    // Overloaded "-" operator
    Complex operator-(Complex expr) 
    {
        Complex res(re - expr.re, im - expr.im);
        return res;
    }

    // Overloaded "*" operator
    Complex operator*(Complex expr)
    {
        Complex res(re * expr.re - im * expr.im, 
                    im * expr.im + im * expr.im);
        return res;
    }

    // Overloaded "/" operator
    Complex operator/(Complex expr)
    {
        double dvs = expr.re * expr.re + expr.im * expr.im;

        // Here our "/" operator is not overloaded
        Complex res((re * expr.re - im * expr.im) / dvs,
                    (im * expr.im + im * expr.im) / dvs);
        return res;
    }
};

int main()
{
    // Default initialization
    Complex clx1(1.1, 2.2);
    Complex clx2(3.3, 4.4);

    // Complex clx3 = clx1.operator+(clx2);
    Complex clx3 = clx1 + clx2;

    // Overloaded initialization in action
    Complex clx_array[5];

    printf("clx3: [%.1f, %.1f]\n", clx3.GetRe(), clx3.GetIm());
    // clx3: [4.4, 6.6]

    return 0;
}
```
[Back to TOC](#contents-)

## Inline
```cpp
#include <iostream>

inline int sum(int a, int b)
{
    return a + b;
}

int main()
{
    int a(2), b(3), res(0);

    // Here inline works as #define
    // res = a + b;
    res = sum(a, b);

    return 0;
}
```
[Back to TOC](#contents-)

## Extern
> "foo.h" file
```cpp
#ifdef __cplusplus
extern "C" int foo(int, int); // C++ compiler sees this
#else
int foo(int, int);            // C compiler sees this
#endif
```
[Back to TOC](#contents-)