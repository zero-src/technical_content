#include "calc.h"

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

Matrix* calc::idkWhatThisShitDoes(Matrix* const & source, const array_t & free_terms, uint16_t col_id)
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

