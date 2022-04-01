//
// Created by Death on 1/26/2022.
//
#ifndef COURSE_EQUATION_H
#define COURSE_EQUATION_H

#include <iostream>

struct Matrix {
    uint16_t m_uSize = 0;
    float** mtx;

    Matrix(uint16_t size, float** m) : m_uSize(size), mtx(std::move(m)) { }
    Matrix(uint16_t size) : m_uSize(size)
    {
        mtx = new float* [size];
        for (uint16_t i = 0; i < size; i++)
            mtx[i] = new float [size];
    }
};

class Equation {
    uint16_t size_ = 0;

    float* free_terms_;
    float** mtx_;

    static void getMinor(const Matrix & src, uint16_t ignored_row_id, Matrix & minor);
public:
    float* m_fRoots;

    explicit Equation(uint16_t size);

    uint16_t getSize() const;
    Matrix getAsMatrix();

    void printEquationSystem();
    void init_free_terms();
    void init_matrix();
    void safe_matrix();

    void safeMatrix(uint16_t col_id, Matrix & copy_to);
    float getDeterminant(const Matrix & det);

    ~Equation();
};

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

#endif //COURSE_EQUATION_H