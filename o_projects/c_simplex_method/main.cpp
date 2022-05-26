#include "Drawing/Renderer.h"
#include "Maths/Equation.h"

int main()
{
    auto *table = new Table();
    auto *e = new Equation();

    // Equation: start
    e->setupParams();
    e->printParamsAsTable();

    // Resriction: start / normalize
    e->setupRestrictions();
    e->setupNormalizedRestrictions();
    e->printRestrictionsAsTable();

    // Main part
    std::vector<std::string> table_sections { "Bv", "Cbv" };
    std::vector<std::string> table_results {};
    std::vector<std::string> table_delta {};

    uint16_t param_count(e->normalized_restricts()[0].size());
    uint16_t s_count(e->normalized_restricts().size());
    uint16_t x_count(param_count - s_count - 1);

    for (uint16_t i = 0; i < param_count; i++)
    {
        if (i <= x_count)
            table_sections.emplace_back("x" + std::to_string(i+1));

        if (i >= param_count - x_count - 1)
            table_sections.emplace_back("s" + std::to_string(i - x_count));

        if (i == param_count - 1)
            table_sections.emplace_back("result");
    }

    table->new_row(table_sections);

    table->update();
    table->draw();

    return 0;
}