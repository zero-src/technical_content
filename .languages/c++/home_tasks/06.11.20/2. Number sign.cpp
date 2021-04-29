#include <iostream>

int sign(float x) {
    return x < 0 ? -1 : (x == 0 ? 0 : 1);
}
int main()
{
    float fl;
    std::cout << "Num: ";
    std::cin >> fl;
    std::cout << sign(fl) << std::endl;

	system("pause");
	return 0;
}