#include <algorithm>
#include <iostream>
#include <fstream>
#include <string>
#include <vector>

int main()
{
    std::ofstream out_fStream;
    std::ifstream inp_fStream;

    std::string file_name = "classwork.txt";
    std::vector<int> vec1 = { 9, 8, 7, 8 };
    std::vector<int> vec2 = { 1, 2, 3, 4 };

    out_fStream.open(file_name);
    if (out_fStream.is_open())
    {
        for (auto & x : vec1)
            out_fStream << x << "; ";
        out_fStream << std::endl;

        for (auto & x : vec2)
            out_fStream << x << "; ";
        out_fStream << std::endl;
    }
    out_fStream.close();

    // Reads single word
    inp_fStream.open(file_name);
    if (inp_fStream.is_open())
    {
        std::size_t sum(0);
        std::string s;
        while (!inp_fStream.eof())
        {
            std::size_t pos;
            getline(inp_fStream, s, ';');

            if ((pos  = s.find('\n') )!= std::string::npos)
                s.erase(pos, 1);
            s.erase(std::remove(s.begin(), s.end(), ' '), s.end());

            if (s.empty())
                continue;

            std::cout << std::stoi(s) << " ";
            sum += std::stoi(s);
        }
        std::cout << "\n" << sum << "\n";
    }
    inp_fStream.close();

    return 0;
}