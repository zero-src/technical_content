#include <iostream>

int main()
{
    uint16_t n; std::cout << "n: "; std::cin >> n;
    int** mtx = new int *[n];
    int** tmp_mtx = new int *[n];

    int number_to_find(0);
    uint16_t min_zero_count(n);
    uint16_t col_idx(n);

    // Matrix initialization
    for(uint16_t i = 0; i < n; i++)
    {
        mtx[i] = new int[n];
        tmp_mtx[i] = new int[n];
    }

    // Matrix input
    for (uint16_t i = 0; i < n; i++)
        for (uint16_t j = 0; j < n; j++)
        {
            std::cin >> mtx[i][j];
            tmp_mtx[i][j] = mtx[i][j];
        }

    // Get col idx
    for (uint16_t j = 0; j < n; j++)
    {
        uint16_t o_count = 0;
        for (uint16_t i = 0; i < n; i++)
        {
            if (mtx[i][j] == number_to_find)
                o_count++;
        }

        if (o_count < min_zero_count)
        {
            min_zero_count = o_count;
            col_idx = j;
        }
    }

    uint16_t tmp_count = 0;
    uint16_t tmp_flag = 0;

    // Refactoring first column
    for (int i = 0; i < n; i++)
    {
        if (mtx[i][col_idx] == number_to_find)
        {
            tmp_count++;
            tmp_mtx[n - tmp_count][0] = number_to_find;
            continue;
        }

        tmp_mtx[i - tmp_count][0] = mtx[i][col_idx];
    }

    // If our column idx != 0 then refactoring rest of matrix
    if (col_idx != 0)
        for (uint16_t j = 0; j < n; j++)
            for (uint16_t i = 0; i < n; i++)
            {
                if (j == col_idx && !tmp_flag)
                    tmp_flag = 1;

                tmp_mtx[i][j+1] = mtx[i][j+tmp_flag];
            }

    // Changing main matrix
    mtx = tmp_mtx;

    // Showing our results
    std::cout << "\n";
    for (uint16_t i = 0; i < n; i++)
    {
        for (uint16_t j = 0; j < n; j++)
            std::cout << mtx[i][j] << " ";
        std::cout << "\n";
    }

    delete[] mtx;
    return 0;
}