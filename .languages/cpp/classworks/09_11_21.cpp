#include <algorithm>
#include <iostream>
#include <vector>

auto find(std::vector<int>& v, int to_find)
{
    auto iter_found = v.begin();
    for (auto i = v.begin(); i != v.end(); i++)
    {
        iter_found = i;
        if (*i == to_find)
            break;
    }
    return iter_found;
}

int main()
{
    std::vector<int> vec { 1, 2, 3, 4, 5, 6 };

    auto p = std::find(vec.begin(), vec.end(), 3);
    auto custom_p = find(vec, 3);

    std::cout << std::to_string(p == custom_p);

    return 0;
}