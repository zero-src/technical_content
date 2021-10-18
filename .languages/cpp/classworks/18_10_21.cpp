#include <iostream>
#include <vector>

int main()
{
    // Создание вектора
    std::vector<int> vec { 1, 2, 3, 4, 5 };

    // Добавление значения в конец вектора
    vec.emplace_back( 6 );

    // Создание итерационной переменной,
    // указывающей на начало вектора
    auto p = vec.begin();

    // Вывод значений вектора
    std::cout << "vec:";
    for (auto& x : vec)
        printf(" %i", x);

    // Удаление шестого элемента
    vec.erase( p + 5 );

    // Вставляем пятый элемент, раный 7
    vec.insert(p + 4, 7 );

    // Вывод значений вектора
    std::cout << "\nvec:";
    for (auto& x : vec)
        printf(" %i", x);

    return 0;
}