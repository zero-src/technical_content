# Contents 🚀
- [Reference](#reference)
- [Structs](#structs)
    - [Example](#example)
    - [Private / Public methods](#private--public-methods)
- [Classes](#classes)
    - [Initialisation](#initialisation)
    - [Overloaded operators](#overloaded-operators)
    - [Copy Constructor](#copy-constructor)
    - [Scope resolution operator](#scope-resolution-operator-)
    - [Class members initialization](#class-members-initialization)
- [Exceptions](#exceptions)
- [Inline](#inline)
- [Extern](#extern)
- [OOP](#oop-basics)
    - [Inheritance](#inheritance)

## Reference
>References are not objects; they do not necessarily occupy storage, although the compiler may allocate storage if it is necessary to implement the desired semantics (e.g. a non-static data member of reference type usually increases the size of the class by the amount necessary to store a memory address).

```cpp
#include <iostream>

int main( )
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

>Reference allows you to return multiple values
```cpp
#include <iostream>

void new_numbers(int &a, int &b)
{
    a = 5;
    b = 10;
}

int main( )
{   
    int a(0), b(0);

    // Reference in action
    new_numbers(a, b);

    printf("[a, b]: [%d, %d]\n", a, b);
    // [a, b]: [5, 10]

    return 0;
}
```
[Back to TOC](#contents-)

>Also you are able to **return by reference**
```cpp
#include <iostream>

int& change_var(int& x) {
    return x;
}

int main( )
{   
    int a = 0; 
    change_var(a) = 5;

    printf("a: %d\n", a);
    // a: 5

    return 0;
}
```
[Back to TOC](#contents-)

## Structs

### Example
```cpp
#include <iostream>

struct str_complex {
    double re, im;

    double cpp_mult( )
    { 
        return sqrt(re * re + im * im); 
    }

    double cpp_mult_this( )
    {
        return sqrt(this->re * this->re + this->im * this->im);
    }
};

int main( )
{
    str_complex clx;
    double res, res_this;

    clx.re = 2.7;
    clx.im = 3.8;

    res = clx.cpp_mult( );
    res_this = clx.cpp_mult_this( );
    
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

struct str_complex 
{
private:
    double re, im;
public:
    str_complex(double a_re = 0, double a_im = 0) 
    {
        re = new_re;
        im = new_im;
    }

    std::tuple<double, double> get( )
    {
        return std::make_tuple(re, im);
    }
};

int main()
{
    str_complex clx(2.7, 3.8);
    double clx_re, clx_im;

    // C++14 structured binding:
    std::tie(clx_re, clx_im) = clx.get( );

    // C++17 structured binding:
    auto [struct_re, struct_im] = clx.get( );
    
    /*
    // This code dose the same as code above
    double clx_re, clx_im;

    // C++14 structured binding:
    std::tie(clx_re, clx_im) = str_complex(2.7, 3.8).get( );

    // C++17 structured binding:
    auto [struct_re, struct_im] = str_complex(2.7, 3.8).get( );
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
    Complex(double a_re = 0, double a_im = 0)  
        { re = a_re; im = a_im; }

    double GetRe( ) const
        { return re; }

    double GetIm( ) const
        { return im; }

    double Modulo( ) const
        { return sqrt(re * re + im * im); }

    double Argument( ) const
        { return atan2(im, re); }

    // Destructor (works after object destruction)
    ~Complex( ) { 
        if (re != 0 || im != 0) 
        { 
            re = im = 0; 
        } 
    }
};

int main( )
{
    double re, im, mod, arg;

    /*
    re = Complex(2.7, 3.8).GetRe();
    im = Complex(2.7, 3.8).GetIm();
    mod = Complex(2.7, 3.8).Modulo();
    arg = Complex(2.7, 3.8).Argument();
    */

    Complex clx(2.7, 3.8);

    re = clx.GetRe( );
    im = clx.GetIm( );
    mod = clx.Modulo( );
    arg = clx.Argument( );

    return 0;
}
```
[Back to TOC](#contents-)

## Overloaded operators
> Simple overloading
```cpp
#include <iostream>

class Complex {
    double re, im;
public:
    Complex(double a_re, double a_im) 
    { 
        re = a_re; im = a_im; 
    }

    // Overloaded "+" operator
    Complex operator+(const Complex &expr) const
    {
        Complex res(re + expr.re, im + expr.im);
        return res;
    }

    // Overloaded "-" operator
    Complex operator-(const Complex &expr) const
    {
        Complex res(re - expr.re, im - expr.im);
        return res;
    }

    // Overloaded "*" operator
    Complex operator*(const Complex &expr) const
    {
        Complex res(re * expr.re - im * expr.im, 
                    im * expr.im + im * expr.im);
        return res;
    }

    // Overloaded "/" operator
    Complex operator/(const Complex &expr) const
    {
        double dvs = expr.re * expr.re + expr.im * expr.im;
        Complex res((re * expr.re - im * expr.im) / dvs,
                    (im * expr.im + im * expr.im) / dvs);
        return res;
    }
};

int main( )
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

> ++ and -- overloading
```cpp
#include <iostream>

#define send(x) std::cout << x << std::endl

class A {
public:
    void operator++()       { send("first");    }
    void operator--()       { send("second");   }
    void operator++(int)    { send("third");    }
    void operator--(int)    { send("fourth");   }
};

int main()
{
    A a;

    ++a; // => first
    a++; // => third

    --a; // => second
    a--; // => fourth

    return 0;
}
```
[Back to TOC](#contents-)

```cpp
#include <iostream>

#define send(x) std::cout << x << std::endl

class A {
    int i;
public:
    A(int x) : i(x) { }

    const A& operator++()
    {
        i++; return *this;
    }

    A operator++(int)
    {
        A tmp(*this); i++; return tmp;
    }

    void Get() const
    {
        send(i);
    }
};

int main()
{
    A a(0), b(0);

    a = 10;
    b = ++a;

    a.Get(); // => 11
    b.Get(); // => 11

    a = 10;
    b = a++;

    a.Get(); // => 11
    b.Get(); // => 10

    return 0;
}
```
[Back to TOC](#contents-)

> "Operator" overloading by simple functions
```cpp
#include <iostream>

class Complex {
    double re, im;
public:
    Complex(double a_re, double a_im) : re(a_re), im(a_im) { }
    Complex(double a_re) : re(a_re), im(0) { }
    Complex() : re(0), im(0) { }

    Complex operator+(const Complex& expr) const
    {
        return Complex(re + expr.re, im + expr.im);
    }
};

int main()
{
    Complex x, y, z;

    x = y + z; // correct
    x = x + 0.5; // correct

    x = 0.5 + x; // error

    return 0;
}
```
[Back to TOC](#contents-)

> To avoid this error we must recode our overloading
```cpp
#include <iostream>

class Complex {
    double re, im;
public:
    Complex(double a_re, double a_im) : re(a_re), im(a_im) { }
    Complex(double a_re) : re(a_re), im(0) { }
    Complex() : re(0), im(0) { }

    double GetRe() const
    {
        return re;
    }

    double GetIm() const
    {
        return im;
    }
};

Complex operator+(const Complex& a, const Complex& b)
{
    return Complex(a.GetRe() + b.GetRe(), a.GetIm() + b.GetIm());
}

int main()
{
    Complex x, y, z;

    x = y + z; // correct

    x = x + 0.5; // correct
    x = 0.5 + x; // correct

    return 0;
}
```

### OR

```cpp
#include <iostream>

class Complex {
    double re, im;
public:
    Complex(double a_re, double a_im) : re(a_re), im(a_im) { }
    Complex(double a_re) : re(a_re), im(0) { }
    Complex() : re(0), im(0) { }

    double GetRe() const
    {
        return re;
    }

    double GetIm() const
    {
        return im;
    }

    friend Complex operator+(const Complex& a, const Complex& b);
};

Complex operator+(const Complex& a, const Complex& b)
{
    return Complex(a.re + b.re, a.im + b.im);
}

int main()
{
    Complex x, y, z;

    x = y + z; // correct

    x = x + 0.5; // correct
    x = 0.5 + x; // correct

    return 0;
}
```
[Back to TOC](#contents-)

## Copy Constructor

>Example
```cpp
#include <iostream>
#include <string>

class String 
{
private:
    char* m_Buffer;
    unsigned int m_Size;
public:
    String(const char* string)
    { 
        m_Size = strlen(string);
        m_Buffer = new char[m_Size + 1];
        memcpy(m_Buffer, string, m_Size);
        m_Buffer[m_Size] = 0;
    }

    String(const String& other) : m_Size(other.m_Size)
    {
        m_Buffer = new char[m_Size + 1];
        memcpy(m_Buffer, other.m_Buffer, m_Size + 1);
    }

    ~String()
    { 
        delete[] m_Buffer; 
    }

    void PrintLnString()
    {
        for (int i = 0; i < m_Size; i++)
            std::cout << m_Buffer[i];
        std::cout << std::endl;
    }

    char& operator[](unsigned int index) const
    {
        return m_Buffer[index];
    }
};

int main()
{
    String string = "Hello";
    String second = string;

    second[0] = 'G';

    string.PrintLnString( ); // Hello
    second.PrintLnString( ); // Gello

    std::cin.get();
}
```
[Back to TOC](#contents-)

> To avoid class copying you can initialize private copy constructor
```cpp
#include <iostream>

class A {
    int* p;
    unsigned int size;

    A operator=(const A other) const { }

public:
    A() : p(nullptr), size(0) { }
};

int main()
{
    A test_class, tmp_class;
    test_class = tmp_class; // error

    std::cout << "ddd" << std::endl;
    return 0;
}
```
[Back to TOC](#contents-)

## Scope resolution operator "::"
> Example 1
```cpp
#include <iostream>

int variable = 20;

int main()
{
    float variable = 30;

    std::cout << "This is local to the main function: " << variable << std::endl; // => 30
    std::cout << "This is global to the main function: " << ::variable << std::endl; // => 20

    return 0;
}
```
[Back to TOC](#contents-)

> Example 2
```cpp
#include <iostream>

const int x = 5;

namespace foo {
    const int x = 0;
}

int bar() {
    int x = 1;
    return x;
}

struct Meh {
    static const int x = 2;
}

int main() 
{
    std::cout << x; // => 5
    {
        int x = 4;
        std::cout << x; // => 4
        std::cout << ::x; // => 5, this one looks for x outside the current scope
    }
    std::cout << Meh::x; // => 2, use the definition of x inside the scope of Meh
    std::cout << foo::x; // => 0, use the definition of x inside foo
    std::cout << bar(); // => 1, use the definition of x inside bar (returned by bar)

    return 0;
}
```
[Back to TOC](#contents-)

> Example 3
```cpp
#include <iostream>

class Complex 
{
private:
    double re, im;
public:
    Complex(double a_re = 0, double a_im = 0);

    double GetRe() const;
    double GetIm() const;
};

Complex::Complex(double a_re = 0, double a_im = 0)
{
    re = a_re; im = a_im;
}

double Complex::GetRe() const
{
    return re;
}

double Complex::GetIm() const
{
    return im;
}

int main()
{
    double re, im;

    re = Complex(2.7, 3.8).GetRe();
    im = Complex(2.7, 3.8).GetIm();

    return 0;
}
```
[Back to TOC](#contents-)

## Class members initialization
> Example 1
```cpp
#include <iostream>

class A 
{
private:
    int x, y;
public:
    A(int o_x, int o_y) 
    { 
        x = o_x; 
        y = o_y; 
    }
};

class B 
{
private:
    A a;
public:
    B();
};

// Initializing "A B::a" field
B::B() : a(2, 3)
{
    // ...
}

int main()
{
    // ...
    return 0;
}
```
[Back to TOC](#contents-)

> Example 2
```cpp
#include <iostream>

class Complex {
    double re, im;
public:
    Complex(double a_re, double a_im) : re(a_re), im(a_im) { }
    Complex(double a_re) : re(a_re), im(0) { }
    Complex() : re(0), im(0) { }

    double GetRe( ) const
        { return re; }

    double GetIm( ) const
        { return im; }
};

int main()
{
    double re, im;

    re = Complex(2.7, 3.8).GetRe(); // => 2.7
    im = Complex(7.2).GetIm(); // => 0

    return 0;
}
```
[Back to TOC](#contents-)

## Exceptions
```cpp
#include <iostream>
#include <vector>
 
int main() {
    try {
        std::cout << "Throwing an integer exception...\n";
        throw 42;
    } catch (int i) {
        std::cout << " the integer exception was caught, with value: " << i << '\n';
    }
 
    try {
        std::cout << "Creating a vector of size 5... \n";
        std::vector<int> v(5);
        std::cout << "Accessing the 11th element of the vector...\n";
        std::cout << v.at(10); // vector::at() throws std::out_of_range
    } catch (const std::exception& e) { // caught by reference to base
        std::cout << e.what() << "'\n";
    }

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

int main( )
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

## OOP Basics

### Inheritance
> Inheritance example

![oop_basics](https://github.com/zero-src/technical_content/blob/master/.languages/cpp/data/oop_inh.png)
```cpp
struct person {
    char name[64];
    char sex;
    int year_of_birth;
};

struct student : person {
    int code;
    int year;
    float average;
};

int main()
{
    student s1;
    strcopy(s1.name, "John Doe");

    s1.sex = 'm';
    s1.year_of_birth = 1989;
    s1.code = 51311;
    s1.year = 2;
    s1.average = 4.75;

    return 0;
}
```