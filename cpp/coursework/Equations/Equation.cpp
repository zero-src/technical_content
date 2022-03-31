//
// Created by Death on 1/26/2022.
//

#include "Equation.h"

Equation::Equation(uint16_t size)
{
    size_ = size;

    free_terms_ = new float[size];
    mtx_ = new float*[size];

    for (uint16_t i = 0; i < size; i++)
        mtx_[i] = new float[size];
}

Equation::~Equation()
{
    for (uint16_t i = 0; i < size_; i++)
        delete [] mtx_[i];
    delete [] mtx_;

    std::cout << "Dein Hintern ist gewaschen O_o\n";
}

uint16_t Equation::getSize() const
{
    return size_;
}

void Equation::init_free_terms()
{
    std::cout << "\nВведите свободные члены (от -100.0 до 100.0):\n";

    for (uint16_t i = 0; i < size_; i++)
    {
        printf("free_term[%d]:", i+1);
        s_number_input<float>(free_terms_[i], -100.0, 100.0);
    }
}

void Equation::init_matrix()
{
    std::cout << "\nВведите матрицу коэффициентов (от -100.0 до 100.0):\n";

    for (uint16_t i = 0; i < size_; i++)
        for (uint16_t j = 0; j < size_; j++)
        {
            printf("mtx[%d][%d]:", i+1, j+1);
            s_number_input<float>(mtx_[i][j], -100.0, 100.0);
        }
}

void Equation::printEquationSystem()
{
    std::cout << "\nЗаданная система линейных уравнений:\n";

    for (uint16_t i = 0; i < size_; i++)
    {
        for (uint16_t j = 0; j < size_ - 1; j++)
            printf("%7.2f * x%d + ", mtx_[i][j], j + 1);
        printf("%6.2f * x%d = %6.2f\n", mtx_[i][size_ - 1], size_, free_terms_[i]);
    }

    std::cout << std::endl;
}


