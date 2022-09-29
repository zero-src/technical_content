//
// Created by Death on 4/13/2022.
//

#ifndef COURSE_MATRIX_H
#define COURSE_MATRIX_H

#include <iostream>

typedef float*  array_t;
typedef array_t* matrix_t;

struct Matrix {
    uint16_t n_size = 0, m_size = 0;
    matrix_t matrix {};

    explicit Matrix(Matrix* const & src, const float* vec);
    explicit Matrix(uint16_t size);

    ~Matrix();
};

#endif //COURSE_MATRIX_H
