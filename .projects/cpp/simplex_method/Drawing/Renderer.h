//
// Created by Death on 10/24/2021.
//

#ifndef LEARN_CPP_RENDERER_H
#define LEARN_CPP_RENDERER_H

#include "../includes.h"

#define _(x) std::to_string(x)

class Table {
    std::vector<std::vector<std::string>> rows_ {};
    std::vector<std::string> row_ {};
    std::vector<uint8_t> size_ {};
    uint8_t full_size_ = 0;

    char bound_;
    char corner_;
    char fill_;

    void setupMaxColSizes(std::vector<std::vector<std::string>> const & list);
    void setupFullSize();
public:
    Table() : bound_('|'), corner_('+'), fill_('-') { }

    void new_item(std::string const & item);
    void new_row(std::vector<std::string> const & row);

    void end_row();

    void update();
    void draw() const;
};

#endif //LEARN_CPP_RENDERER_H