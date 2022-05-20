//
// Created by Death on 10/24/2021.
//

#include "Renderer.h"

void Table::setupMaxColSizes(std::vector<std::vector<std::string>> const & list)
{
    std::vector<uint8_t> max_list(list.begin()->size());
    for (const auto & row : rows_)
        for (auto i = 0; i < row.size(); i++)
        {
            if (row[i].length() + 2 > max_list[i])
                max_list[i] = row[i].length() + 2;
        }

    size_ = max_list;
}

void Table::setupFullSize()
{
    full_size_ = size_.size() - 1;
    for (auto & x : size_)
        full_size_ += int(x);
}

void Table::new_row(std::vector<std::string> const & row)
{
    rows_.emplace_back(row);
}

void Table::update()
{
    setupMaxColSizes(rows_);
    setupFullSize();
}

void Table::draw() const
{
    std::cout << corner_ << std::string(full_size_, fill_) << corner_ << std::endl;
    for (const auto & row : rows_)
    {
        std::cout << bound_;
        for (auto i = 0; i < row.size(); i++)
        {
            std::cout << std::setw(size_[i] - 1) << row[i] << ' ' << bound_;
        }
        std::cout << std::endl;
        std::cout << corner_ << std::string(full_size_, fill_) << corner_ << std::endl;
    }
}

void Table::new_item(const std::string &item)
{
    row_.emplace_back(item);
}

void Table::end_row()
{
    rows_.emplace_back(row_);
    row_.assign(0, "");
}
