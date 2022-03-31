//
// Created by Death on 1/26/2022.
//
#ifndef COURSE_EQUATION_H
#define COURSE_EQUATION_H

#include <iostream>

template<typename T>
void s_number_input(T& number, T min, T max)
{
    while (!(std::cin >> number) || number > max || number < min)
    {
        std::cin.clear();
        std::cin.ignore(10000, '\n');
        std::cout << "Введите число от " << min << " до " << max << ":";
    }
}

class Equation {
    uint16_t size_ = 0;

    float* free_terms_;
    float** mtx_;
public:
    explicit Equation(uint16_t size);

    uint16_t getSize() const;

    void printEquationSystem();

    void init_free_terms();
    void init_matrix();

    ~Equation();
};

#endif //COURSE_EQUATION_H