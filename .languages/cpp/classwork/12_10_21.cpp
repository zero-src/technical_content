#include <iostream>
#include <string>

class Cpu {
	float m_fFreq;
	int m_iCost;
	std::string m_sFirm;
public:
	Cpu(float fr, int cost, std::string name)
		: m_fFreq(fr), m_iCost(cost), m_sFirm(name) 
		{ std::cout << "object created\n"; }
	~Cpu() { std::cout << "deleted obj\n"; }

	// m_fFreq
	float GetFreq() const { return m_fFreq; }
	void SetFreq(float fr) { m_fFreq = fr; }

	// m_iCost
	int GetCost() const { return m_iCost; }
	void SetCost(int val) { m_iCost = val; }

	// m_sFirm
	std::string GetFirm() const { return m_sFirm; }
	void SetFirm(std::string name) { m_sFirm = name; }
};

void f()
{
	Cpu *cpu1 = new Cpu(3.7, 1200, "Ryzen");
	delete cpu1;
}

int main()
{
	f();

	system("pause");
	return 0;
}