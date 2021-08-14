# Contents 🚀
- [Float to number](#float-to-number)
- [Lists](#lists)

## Float to number
```c
#include <stdio.h>

int main(){

    long number;
    float x;

    x = 3.14;
    number = *(long)&x;

    printf("new nubmer: %d", number);

    return 0;
}
```
[Back to TOC](#contents-)

## Lists
```c
#include <stdio.h>
#include <stdlib.h>

#define INT_LIST_SIZE 5

void delete_from_int_list(struct item** pcur, int (*crit)(int));
void print_int_list(struct item *p);

struct item* fill_int_list(int size, int offset);

int is_negative(int x);

struct item {
	int data;
	struct item *next;
};

int main()
{
	struct item *first = malloc(INT_LIST_SIZE * sizeof(struct item));

	first = fill_int_list(INT_LIST_SIZE, -2);
	delete_from_int_list(&first, &is_negative);
	print_int_list(first);

	return 0;
}

int is_negative(int x) { return x < 0; }

void print_int_list(struct item* p) 
{
	if (p)
	{
		printf("%d ", p->data);
		print_int_list(p->next ? p->next : NULL);
	}
}

struct item* fill_int_list(int size, int offset)
{
	struct item* first = NULL, *tmp;

	int s_size = size + offset - 1;
	int s_end = offset;

	for (int i = s_size; i >= s_end; i--)
	{
		tmp = malloc(sizeof(struct item));
		tmp->data = i;
		tmp->next = first;
		first = tmp;
	}

	return first;
}

void delete_from_int_list(struct item** pcur, int (*crit)(int))
{
	while (*pcur)
	{
		if ((*crit)((*pcur)->data))
		{
			struct item* tmp = *pcur;
			*pcur = (*pcur)->next;
			free(tmp);
		} else
		{
			pcur = &(*pcur)->next;
		}
	}
}
```
[Back to TOC](#contents-)