//
// Created by Death on 10/27/2021.
//

#include "Equation.h"

void Equation::setupParams()
{
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
    while (equation_as_string.find('x') && !equation_as_string.empty())
    {
        uint8_t pos = equation_as_string.find_first_of('x');

        params_.emplace_back(std::stod(equation_as_string.substr(0, pos)));
        equation_as_string.erase(0, pos + 1);
    }
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
        while (equation_as_string.find('x') && !equation_as_string.empty()) {
            uint8_t pos = equation_as_string.find_first_of('x');

            tmp_equation.emplace_back(std::stod(equation_as_string.substr(0, pos)));
            equation_as_string.erase(0, pos + 1);
        }
        restricts_.emplace_back(tmp_equation);
        std::cout << "\n";
    }
}

void Equation::printParams() const
{
    for (const auto& x : params_)
        std::cout << x << " ";
    std::cout << "\n";
}

void Equation::printRestrictions() const
{
    for (const auto& x : restricts_)
    {
        for (const auto &y: x)
            m_Table->new_item(_(y));
        m_Table->end_row();
    }
    m_Table->update();
    m_Table->draw();
}