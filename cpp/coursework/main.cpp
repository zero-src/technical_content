#include <cmath>

#include "Equations/Equation.h"

int main()
{
    uint16_t size;

    std::cout << "Введите количество уравнений и неизвестных в системе (от 2 до 6):";
    s_number_input<uint16_t>(size, 2, 6);

    auto e = new Equation(size);

    // Инициализация матрицы
    e->init_matrix();

    // Инициализация свободных членов
    e->init_free_terms();

    // Вывод системы линейных уравнений
    e->printEquationSystem();

    float det = e->getDeterminant(e->getAsMatrix());

    if (std::abs(det) >= 0.01f)
    {
        std::cout << "Метод Крамера\n";

        Matrix mtx = e->getSize();
        for (uint16_t i = 0; i < e->getSize(); i++)
        {
            e->safeMatrix(i, mtx);
            e->m_fRoots[i] = e->getDeterminant(mtx) / det;

            if (std::abs(e->m_fRoots[i]) < 0.0001f)
                printf("x%d = 0\n", i+1);
            else
                printf("x%d = %7.4f\n", i+1, e->m_fRoots[i]);
        }
    }

    // Удаление мусора из памяти
    delete e;

    return 0;
}