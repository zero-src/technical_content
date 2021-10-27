//
// Created by Death on 10/27/2021.
//

#ifndef LEARN_CPP_EQUATION_H
#define LEARN_CPP_EQUATION_H

#include "../includes.h"
#include "../Drawing/Renderer.h"

typedef std::vector<double> equation_t;
typedef std::vector<std::vector<double>> restricts_t;

class Equation {
    Table *m_Table = new Table();

    equation_t params_ {};

    restricts_t restricts_ {};
    restricts_t normalized_restricts_ {};
public:
    ~Equation() { delete m_Table; }

    // params_
    equation_t params() const { return params_; }
    void printParams() const;
    void setupParams();

    // restricts_
    void printRestrictions() const;
    void setupRestrictions();
};

#endif //LEARN_CPP_EQUATION_H
