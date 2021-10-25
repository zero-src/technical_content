#include <iostream>
#include <vector>

class Man {
protected:
	__int16 age_;
	__int16 weight_;
	__int16 tall_;
public:
	Man(__int16 age, __int16 weight, __int16 tall)
		: age_(age), weight_(weight), tall_(tall) {}
};

class Worker : public Man {
private:
	__int32 salary_;
public:
	Worker(__int16 age, __int16 weight, __int16 tall, __int32 salary)
		: Man(age, weight, tall), salary_(salary) {}

	// salary_
	__int32 getSalary() const { return salary_; }
};

int main()
{
	std::vector<Worker*> p_worker{
		new Worker(18, 182, 171, 22500),
		new Worker(19, 63, 186, 47500)
	};

	unsigned __int32 avg_salary(0), max_salary(0);

	for (auto& x : p_worker)
	{
		if (x->getSalary() > max_salary)
			max_salary = x->getSalary();
		avg_salary += x->getSalary();
	}
	avg_salary /= p_worker.size();

	printf("max: %u | avg: %u\n", max_salary, avg_salary);

	system("pause");
	return 0;
}
