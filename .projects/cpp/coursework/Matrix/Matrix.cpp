//
// Created by Death on 4/13/2022.
//

#include "Matrix.h"

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

Matrix::Matrix(Matrix* const & src, const float* vec) : n_size(src->n_size), m_size(src->m_size+1)
{
    this->matrix = new float* [src->n_size];
    for (uint16_t i = 0; i < src->n_size; i++)
        this->matrix[i] = new float [src->m_size+1];

    for (uint16_t i = 0; i < src->n_size; i++)
    {
        for (uint16_t j = 0; j < src->m_size+1; j++)
            this->matrix[i][j] = src->matrix[i][j];

        this->matrix[i][src->m_size] = vec[i];
    }
}
