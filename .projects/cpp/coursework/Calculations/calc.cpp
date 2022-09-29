#include "calc.h"

#include <cmath>

void calc::manualMatrixInput(matrix_t& mtx, uint16_t size_n, uint16_t size_m)
{
    for (uint16_t i = 0; i < size_n; i++)
        for (uint16_t j = 0; j < size_m; j++) {
            printf("[%d][%d]:", i+1, j+1);
            safeNumberInputT<float>(mtx[i][j], -100.0f, 100.0f);
        }
}

void calc::manualArrayInput(array_t& arr, uint16_t size)
{
    for (uint16_t i = 0; i < size; i++) {
        printf("[%d]:", i+1);
        safeNumberInputT<float>(arr[i], -100.0f, 100.0f);
    }
}

matrix_t calc::getSubMatrix(const matrix_t& matrix, uint16_t size, uint16_t x, uint16_t y)
{
    auto sub_matrix = new float* [size-1];
    uint16_t sub_i = 0;

    for (uint16_t i = 0; i < size; i++) {
        sub_matrix[sub_i] = new float [size-1];
        uint16_t sub_j = 0;

        if (i == y)
            continue;

        for (uint16_t j = 0; j < size; j++) {
            if (j == x)
                continue;

            sub_matrix[sub_i][sub_j] = matrix[i][j];
            sub_j++;
        }

        sub_i++;
    }

    return sub_matrix;
}

float calc::getDeterminant(const matrix_t& matrix, uint16_t size)
{
    if (size == 2)
        return matrix[0][0] * matrix[1][1] - matrix[1][0] * matrix[0][1];

    float det = 0.0f;
    for (uint16_t x = 0; x < size; x++)
        det += ((x % 2 == 0 ? 1.0f : -1.0f) * matrix[0][x] *
                getDeterminant(getSubMatrix(matrix, size, x, 0), size - 1));

    return det;
}

Matrix* calc::coolFuncName(Matrix* const & source, const array_t & free_terms, uint16_t col_id)
{
    auto copy_to = new Matrix(source->n_size);
    for (uint16_t i = 0; i < source->n_size; i++)
    {
        for (uint16_t j = 0; j < col_id; j++)
            copy_to->matrix[i][j] = source->matrix[i][j];

        copy_to->matrix[i][col_id] = free_terms[i];

        for (uint16_t j = col_id + 1; j < source->n_size; j++)
            copy_to->matrix[i][j] = source->matrix[i][j];
    }

    return copy_to;
}

bool calc::identityMatrix(Matrix* src)
{
    int n1 = src->n_size-1;
    float c;

    for (int i = 0; i < n1; ++i)
    {
        int j = i+1;
        while (std::fabs(src->matrix[i][i]) < 0.0001 && j < src->n_size)
        {
            if (std::fabs(src->matrix[j][i]) >= 0.0001)
            {
                for (int k = i; k < src->m_size; ++k)
                {
                    float b = src->matrix[j][k];
                    src->matrix[i][k] = src->matrix[j][k];
                    src->matrix[j][k] = b;
                }
            }
            j++;
        }

        c = src->matrix[i][i];
        if (std::fabs(c) < 0.0001)
            return false;

        for (int jj = i; jj < src->m_size; ++jj)
            src->matrix[i][jj] /= c;

        for (int jj = i+1; jj < src->n_size; ++jj)
        {
            c = src->matrix[jj][i];
            if (std::fabs(c) >= 0.0001)
                for (int k = 0; k < src->m_size; ++k)
                    src->matrix[jj][k] -= src->matrix[i][k]*c;
        }
    }

    c = src->matrix[n1][n1];
    if (std::fabs(c) < 0.0001)
        return false;

    for (int j = n1; j < src->m_size; ++j)
        src->matrix[n1][j] /= c;

    for (int i = n1; i > 0; --i)
        for (int j = i-1; j >= 0; --j)
        {
            c = src->matrix[j][i];
            if (std::fabs(c) >= 0.0001)
                for (int k = i; k < src->m_size; ++k)
                    src->matrix[j][k] -= c * src->matrix[j][k];
        }
    return true;
}

