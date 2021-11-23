#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <sstream>

double sum_from_file(std::ifstream & f, const std::string & file_name, char sep)
{
    double sum(0.0);
    f.open(file_name);
    if (f.is_open())
    {
        std::string s;
        while (!f.eof())
        {
            getline(f, s);
            std::stringstream str_stream(s);

            while (getline(str_stream, s, sep))
                if (std::stod(s) > 0.0)
                    sum += std::stod(s);
        }
    }
    f.close();

    return sum;
}

int main()
{
    // Дано 2 файла вещественных чисел а1.txt и а2.txt. Найти сумму положительных элементов в двух файлов
    std::ifstream inp_fStream1, inp_fStream2;

    // Get sum from file 1
    double sum1 = sum_from_file(inp_fStream1, "a1.txt", ' ');
    double sum2 = sum_from_file(inp_fStream2, "a2.txt", ' ');

    std::cout << sum1 << "\n";
    std::cout << sum2 << "\n";

    return 0;
}