#include "Calculations/calc.h"

uint16_t equations_count = 0;

int main()
{
    std::cout << "Введите количество уравнений в системе (от 2 до 6):";
    calc::safeNumberInputT<uint16_t>(equations_count, 2, 6);

    auto* mtx               = new Matrix(equations_count);
    auto* free_terms        = new float [equations_count];
    auto* equation_roots    = new float [equations_count];

    std::cout << "\nВведите матрицу коэффициентов (от -100.0 до 100.0):\n";
    calc::manualMatrixInput(mtx->matrix, mtx->n_size, mtx->n_size);

    std::cout << "\nВведите свободные члены (от -100.0 до 100.0):\n";
    calc::manualArrayInput(free_terms, equations_count);

    std::cout << "\nЗаданная система линейных уравнений:\n";
    for (uint16_t i = 0; i < equations_count; i++) {
        for (uint16_t j = 0; j < equations_count - 1; j++)
            printf("%7.2f * x%d + ", mtx->matrix[i][j], j + 1);
        printf("%6.2f * x%d = %6.2f\n", mtx->matrix[i][equations_count - 1], equations_count, free_terms[i]);
    }

    float determinant = calc::getDeterminant(mtx->matrix, mtx->n_size);

    if (std::abs(determinant) >= 0.01f)
    {
        std::cout << "\nМетод Крамера\n";
        Matrix* tmp_mtx;

        for (uint16_t i = 0; i < equations_count; i++)
        {
            tmp_mtx = calc::idkWhatThisShitDoes(mtx, free_terms, i);
            equation_roots[i] = calc::getDeterminant(tmp_mtx->matrix, tmp_mtx->n_size) / determinant;

            if (std::abs(equation_roots[i]) < 0.0001f)
                printf("x%d = 0\n", i+1);
            else
                printf("x%d = %7.4f\n", i+1, equation_roots[i]);
        }
    }

    delete [] equation_roots;
    delete [] free_terms;
    delete mtx;

    return 0;
}

