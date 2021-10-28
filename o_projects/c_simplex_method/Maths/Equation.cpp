//
// Created by Death on 10/27/2021.
//

#include "Equation.h"

void Equation::setupParams()
{
    tables_.erase(tables_.begin());
    std::string equation_as_string;

    std::cout << "ENTER EQUATION: z = ";
    std::getline(std::cin >> std::ws, equation_as_string);

    // Erase all spaces
    equation_as_string.erase(
            remove(
                equation_as_string.begin(),
                equation_as_string.end(),
                ' '
            ),
            equation_as_string.end()
    );

    // Parsing params into params_ vector
    while (equation_as_string.find('x') != std::string::npos && !equation_as_string.empty())
    {
        uint16_t pos = equation_as_string.find_first_of('x');

        params_.emplace_back(std::stoi(equation_as_string.substr(0, pos)));
        equation_as_string.erase(0, pos + 1);
    }
    tables_[0]->new_row(vectorToStr(params_));
}

void Equation::printParamsAsTable() const
{
    std::cout << "\n";
    tables_[0]->update();
    tables_[0]->draw();
}

void Equation::setupRestrictions()
{
    std::string equation_as_string;
    equation_t tmp_equation {};
    uint16_t r_count;

    std::cout << "\nRESTRICTIONS COUNT: ";
    std::cin >> r_count; std::cout << "\n";

    for (uint16_t i = 0; i < r_count; i++)
    {
        std::cout << "RESTRICTION: ";
        std::getline(std::cin >> std::ws, equation_as_string);

        // Clean temporary vector
        tmp_equation = {};

        // Erases all spaces
        equation_as_string.erase(
                remove(
                        equation_as_string.begin(),
                        equation_as_string.end(),
                        ' '
                ),
                equation_as_string.end()
        );

        // Parsing params into params_ vector
        while (equation_as_string.find('x') != std::string::npos && !equation_as_string.empty())
        {
            uint16_t pos = equation_as_string.find_first_of('x');

            tmp_equation.emplace_back(std::stoi(equation_as_string.substr(0, pos)));
            equation_as_string.erase(0, pos + 1);
        }

        tmp_equation.emplace_back(0);
        if (equation_as_string.find("<=") != std::string::npos)
        {
            equation_as_string.erase(0, 2);
            tmp_equation.emplace_back(std::stoi(equation_as_string));
        }

        if (equation_as_string.find(">=") != std::string::npos)
        {
            equation_as_string.erase(0, 2);
            tmp_equation.emplace_back(std::stoi(equation_as_string));

            for (uint32_t j = 0; j < tmp_equation.size(); j++)
            {
                if (j == tmp_equation.size() - 2)
                    continue;
                tmp_equation[j] = -tmp_equation[j];
            }
        }

        restricts_.emplace_back(tmp_equation);
        std::cout << "\n";
    }
}

void Equation::setupNormalizedRestrictions()
{
    tables_.erase(tables_.begin() + 1);
    for (auto & x : restricts_)
    {
        normalized_restricts_.emplace_back(x);
        tables_[1]->new_row(vectorToStr(x));
    }
}

std::vector<std::string> Equation::vectorToStr(equation_t const & vec)
{
    std::vector<std::string> v;
    for (const auto& x : vec)
        v.emplace_back(_(int(x)));
    return v;
}

void Equation::printRestrictionsAsTable() const
{
    tables_[1]->update();
    tables_[1]->draw();
}
