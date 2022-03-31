#include "Equations/Equation.h"

int main()
{
    uint16_t size;

    std::cout << "Введите количество уравнений и неизвестных в системе (от 2 до 6):";
    s_number_input<uint16_t>(size, 2, 6);

    auto e = new Equation(size);

    // Проверка количства уравнений
    std::cout << "DEBUG: size_ = " << e->getSize() << std::endl;

    // Инициализация матрицы
    e->init_matrix();

    // Инициализация свободных членов
    e->init_free_terms();

    // Вывод системы линейных уравнений
    e->printEquationSystem();

    // Удаление мусора из памяти
    delete e;

    return 0;
}