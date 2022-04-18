//
// Created by Death on 4/13/2022.
//

#include "Matrix.h"

Matrix::Matrix(uint16_t size_n, uint16_t size_m) : n_size(size_n), m_size(size_m)
{
    this->matrix = new float* [size_n];
    for (uint16_t i = 0; i < size_n; i++)
        this->matrix[i] = new float [size_m];
}

Matrix::Matrix(uint16_t size) : n_size(size), m_size(size)
{
    this->matrix = new float* [size];
    for (uint16_t i = 0; i < size; i++)
        this->matrix[i] = new float [size];
}

Matrix::~Matrix()
{
    for (uint16_t i = 0; i < this->n_size; i++)
        delete [] this->matrix[i];

    delete [] this->matrix;
}
