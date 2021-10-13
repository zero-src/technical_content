#include <iostream>

int main()
{
	int *arr = new int[5] { -3, 1, 5, -1, 7 };
	int min(*arr);

	// minimum
	for (int i(1); i < 5; i++)
		min = min > arr[i] ? arr[i] : min;
	printf("min: %i\n", min);

	// summ
	int first_idx(-1), last_idx(-1), sum(0);
	for (int i(0); i < 5; i++)
		if (arr[i] >= 0)
		{
			first_idx = i;
			break;
		}

	if (first_idx == -1)
	{
		throw "no positivs";
		return 1;
	}

	for (int i(4); i > first_idx; i--)
		if (arr[i] >= 0)
		{
			last_idx = i;
			break;
		}
 
	for (int i(first_idx); i < last_idx; i++)
		sum += arr[i];

	printf("sum: %i\n", sum);

	system("pause");
	return 0;
}