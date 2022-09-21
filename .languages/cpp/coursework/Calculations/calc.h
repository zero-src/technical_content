//
// Created by Death on 4/14/2022.
//

#ifndef COURSE_CALC_H
#define COURSE_CALC_H

#include "../Matrix/Matrix.h"
#include <cmath>

namespace calc {
    template<typename T>
    void safeNumberInputT(T& number, T min_val, T max_val)
    {
        while (!(std::cin >> number) || number > max_val || number < min_val)
        {
            std::cin.clear();
            std::cin.ignore(10000, '\n');
            std::cout << "Введите число от " << min_val << " до " << max_val << ":";
        }
    }

    Matrix* coolFuncName(Matrix* const & source, const array_t & free_terms, uint16_t col_id);

    matrix_t getSubMatrix(const matrix_t& matrix, uint16_t n, uint16_t x, uint16_t y);

    void manualMatrixInput(matrix_t& mtx, uint16_t size_n, uint16_t size_m);

    void manualArrayInput(array_t& arr, uint16_t size);

    float getDeterminant(const matrix_t& matrix, uint16_t size);

    bool identityMatrix(Matrix* src);
}

#endif //COURSE_CALC_H
