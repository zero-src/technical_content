#include <iostream>
#include <string>

class Car {
	int m_iEngineVol;

public:
	Car(int vol) : m_iEngineVol(vol) {}
	int Get() const { return m_iEngineVol; }
	void Set(int vol)
	{
		if (vol > 0)
			m_iEngineVol = vol;
		else
			std::cout << "Error\n";
	}
};

class Passport {
	int m_iAge; 
	std::string m_sName;
	std::string m_sAdress;
public:
	Passport(int age = 0, std::string name = "", std::string addr = "") 
	{
		if (age < 14)
		{
			std::cout << "Error: Age > 14\n";
			return;
		}
		m_iAge = age;
		m_sName = name;
		m_sAdress = addr;
	}
	
	int GetAge() const { return m_iAge; }
	void SetAge(int age)
	{
		if (age >= 14)
			m_iAge = age;
		else
			std::cout << "Error: Age > 14\n";
	}

	std::string GetName() const { return m_sName; }
	void SetName(std::string name)
	{
		m_sName = name;
	}

	std::string GetAddress() const { return m_sAdress; }
	void SetAddress(std::string addr)
	{
		m_sAdress = addr;
	}
};

int main()
{
	Passport pass(13, "Max", "Moscow");
	std::cout << pass.GetName() << std::endl;

	system("pause");
	return 0;
}