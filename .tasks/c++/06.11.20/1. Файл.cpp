#include <iostream>
#include <fstream>

#define i_file file.open("C:\\Users\\1\\Desktop\\lab\\example.txt")
#define o_file fl.open("C:\\Users\\1\\Desktop\\lab\\example.txt")
struct o_input{
	float* input = new float[10];
	float sum;	
};

int main() {
	auto v = new o_input;
	std::ofstream file;
	std::ifstream fl;

	i_file;
	for (int i = 0; i < 10; i++) {
		std::cin >> v->input[i];
		file << v->input[i] << " ";
	}
	file.close();

	o_file;
	for (int i = 0; i < 10; i++) {
		fl >> v->input[i];
		v->sum += v->input[i];
	}
	fl.close();

	i_file;
	file << v->sum;

	system("pause");
	return 0;
}