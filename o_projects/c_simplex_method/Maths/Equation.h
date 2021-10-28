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
    std::vector<Table*> tables_ { new Table(), new Table(), new Table() };

    equation_t params_ {};

    restricts_t restricts_ {};
    restricts_t normalized_restricts_ {};
public:
    // params_
    equation_t params() const { return params_; }
    void printParamsAsTable() const;
    void setupParams();

    // restricts_
    static std::vector<std::string> vectorToStr(equation_t const & vec);
    void printRestrictionsAsTable() const;
    void setupRestrictions();

    // normalized_restricts_
    restricts_t normalized_restricts() const { return normalized_restricts_; }
    void setupNormalizedRestrictions();
};

#endif //LEARN_CPP_EQUATION_H
