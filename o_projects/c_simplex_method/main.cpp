#include "Drawing/Renderer.h"
#include "Maths/Equation.h"

int main()
{
    auto *table = new Table();
    auto *e = new Equation();

    // Equation: start
    e->setupParams();
    e->printParams();

    // Resriction: start / normalize
    e->setupRestrictions();
    e->printRestrictions();

    return 0;
}