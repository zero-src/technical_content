#include <iostream>
#include <vector>
#include <string>

typedef enum education_t {
	Simple,
	Middle,
	High
};

class Test {
	unsigned __int16 m_iAge;
	bool m_bMale;
	bool m_bQuestion;
	education_t m_eEducation;
public:
	Test(unsigned __int8 age, bool male, education_t education, bool question)
		: m_iAge(age), m_bMale(male), m_bQuestion(question), m_eEducation(education){}
	~Test() = default;

	// m_iAge
	unsigned __int16 GetAge() const { return m_iAge; }

	// m_bMale
	bool IsMale() const { return m_bMale; }

	// m_bQuestion
	bool IsQuestion() const { return m_bQuestion; }

	// m_eEducation
	education_t GetEducation() const { return m_eEducation; }
};

int main()
{
	std::vector<Test*> test{
		new Test(18, true, Middle, false),
		new Test(19, false, Middle, false),
		new Test(51, true, High, true),
		new Test(28, true, Simple, false)
	};

	unsigned int men_over_40(0), women_under_30(0), men_under_25(0);

	for (auto& p : test)
	{
		if (p->GetAge() > 40 && p->GetEducation() > Middle && p->IsQuestion() && p->IsMale())
			men_over_40 += 1;

		if (p->GetAge() > 30 && p->GetEducation() > Simple && !p->IsQuestion() && !p->IsMale())
			women_under_30 += 1;

		if (p->GetAge() < 25 && p->GetEducation() >= Simple && p->IsQuestion() && p->IsMale())
			men_under_25 += 1;
	}

	for (auto& p : test)
		printf("age: %i | male: %s | educetion: %i | quesion: %s\n",
			p->GetAge(), std::to_string(p->IsMale()).c_str(),
			p->GetEducation(), std::to_string(p->IsQuestion()).c_str()
		);

	test.erase(test.begin());

	system("pause");
	return 0;
}
