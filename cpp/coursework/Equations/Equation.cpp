//
// Created by Death on 1/26/2022.
//

#include "Equation.h"

Equation::Equation(uint16_t size)
{
    size_ = size;

    free_terms_ = new float [size];
    m_fRoots = new float [size];
    mtx_ = new float* [size];

    for (uint16_t i = 0; i < size; i++)
        mtx_[i] = new float [size];
}

Equation::~Equation()
{
    for (uint16_t i = 0; i < size_; i++)
        delete [] mtx_[i];

    delete [] free_terms_;
    delete [] m_fRoots;
    delete [] mtx_;

    std::cout << "\n~Equation\n";
}

uint16_t Equation::getSize() const
{
    return size_;
}

Matrix Equation::getAsMatrix()
{
    Matrix m(size_, mtx_);
    return m;
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

void Equation::init_free_terms()
{
    std::cout << "\nВведите свободные члены (от -100.0 до 100.0):\n";

    for (uint16_t i = 0; i < size_; i++)
    {
        printf("free_term[%d]:", i+1);
        s_number_input<float>(free_terms_[i], -100.0, 100.0);
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

void Equation::getMinor(const Matrix & src, uint16_t ignored_row_id, Matrix & minor)
{
    uint16_t x = 0, y = 0;
    for (uint16_t i = 1; i < src.m_uSize; i++)
    {
        for (uint16_t j = 0; j < ignored_row_id; j++)
        {
            minor.mtx[x][y] = src.mtx[i][j];
            y++;
        }

        for (uint16_t j = ignored_row_id + 1; j < src.m_uSize; j++)
        {
            minor.mtx[x][y] = src.mtx[i][j];
            y++;
        }

        y = 0;
        x++;
    }
}

void Equation::safeMatrix(uint16_t col_id, Matrix &copy_to)
{
    for (uint16_t i = 0; i < size_; i++)
    {
        for (uint16_t j = 0; j < col_id; j++)
            copy_to.mtx[i][j] = mtx_[i][j];

        copy_to.mtx[i][col_id] = free_terms_[i];

        for (uint16_t j = col_id + 1; j < size_; j++)
            copy_to.mtx[i][j] = mtx_[i][j];
    }
}

float Equation::getDeterminant(const Matrix & det)
{
    if (det.m_uSize == 2)
        return (det.mtx[0][0] * det.mtx[1][1] - det.mtx[0][1] * det.mtx[1][0]);

    float result = 0.f, pwr = -1.f;
    uint16_t n = det.m_uSize - 1;
    Matrix tmp(n);

    for (uint16_t i = 0; i < det.m_uSize; i++)
    {
        getMinor(det, i, tmp);
        pwr *= -1.f;
        result += pwr * det.mtx[0][i] * getDeterminant(tmp);
    }

    return result;
}