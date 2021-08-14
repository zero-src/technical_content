# Contents 🚀
- [Float to number](#float-to-number)
- [Binary tree](#binary-tree)
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

## Binary tree
```c
#include <stdio.h>
#include <stdlib.h>

struct node {
    int val;
    struct node* left, * right;
};

void int_bin_tree_add(struct node** root, int n)
{
    if (!*root) {
        *root = (struct node*)malloc(sizeof(**root));
        (*root)->val = n;
        (*root)->left = NULL;
        (*root)->right = NULL;
        return;
    }
    if ((*root)->val == n)
        return;
    if (n < (*root)->val)
        int_bin_tree_add(&(*root)->left, n);
    else
        int_bin_tree_add(&(*root)->right, n);
}

void int_bin_tree_print_rec(struct node* r)
{
    if (!r)
        return;
    int_bin_tree_print_rec(r->left);
    printf("%d ", r->val);
    int_bin_tree_print_rec(r->right);
}

void int_bin_tree_print_loop(struct node* r)
{
    enum state { start, left_visited, completed };
    struct backpath {
        struct node* p;
        enum state st;
        struct backpath* next;
    };
    struct backpath* bp = malloc(sizeof(*bp));
    struct backpath* t;
    bp->p = r;
    bp->st = start;
    bp->next = NULL;
    while (bp) {
        switch (bp->st) {
        case start:
            bp->st = left_visited;
            if (bp->p->left) {
                t = malloc(sizeof(*t));
                t->p = bp->p->left;
                t->st = start;
                t->next = bp;
                bp = t;
                continue;
            }
            /* no break here */
        case left_visited:
            printf("%d ", bp->p->val);
            bp->st = completed;
            if (bp->p->right) {
                t = malloc(sizeof(*t));
                t->p = bp->p->right;
                t->st = start;
                t->next = bp;
                bp = t;
                continue;
            }
            /* no break here */
        case completed:
            t = bp;
            bp = bp->next;
            free(t);
        }
    }
}

void int_bin_tree_dispose(struct node* r)
{
    if (!r)
        return;
    int_bin_tree_dispose(r->left);
    int_bin_tree_dispose(r->right);
    free(r);
}


int main()
{
    static const int vals[] = {
        50, 25, 75, 15, 30, 60, 90, 10, 20, 40,
        60, 70, 80, 95,  5, 35, 45, 55, 65, 85
    };
    
    struct node* root = NULL;
    int i;

    for (i = 0; i < sizeof(vals) / sizeof(*vals); i++)
        int_bin_tree_add(&root, vals[i]);

    int_bin_tree_print_rec(root); printf("\n");
    int_bin_tree_print_loop(root); printf("\n");

    int_bin_tree_dispose(root);

    return 0;
}
```
[Back to TOC](#contents-)

## Lists
```c
#include <stdio.h>
#include <stdlib.h>

#define INT_LIST_SIZE 5

struct item {
	int data;
	struct item *next;
};

int is_negative(int x) 
{ 
    return x < 0; 
}

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

int main()
{
	struct item *first = malloc(INT_LIST_SIZE * sizeof(struct item));

	first = fill_int_list(INT_LIST_SIZE, -2);
	delete_from_int_list(&first, &is_negative);
	print_int_list(first);

	return 0;
}
```
[Back to TOC](#contents-)

### Recursive list functions
```c
#include <stdio.h>
#include <stdlib.h>

struct item {
    int val;
    struct item* next;
};

typedef int (*intfunptr)(int, int);

int int_plus(int x, int y)
{ 
	return x + y; 
}

int intlist_reduce_l(intfunptr f, int i, struct item* ls)
{
    return ls ? intlist_reduce_l(f, f(i, ls->val), ls->next) : i;
}

int intlist_reduce_r(intfunptr f, int i, struct item* ls)
{
	return ls ? f(ls->val, intlist_reduce_r(f, i, ls->next)) : i;
}

struct item* fill_int_list(int size, int offset)
{
	struct item* first = NULL, * tmp;

	int s_size = size + offset - 1;
	int s_end = offset;

	for (int i = s_size; i >= s_end; i--)
	{
		tmp = malloc(sizeof(struct item));
		tmp->val = i;
		tmp->next = first;
		first = tmp;
	}

	return first;
}

void print_int_list(struct item* p)
{
	if (p)
	{
		printf("%d ", p->val);
		print_int_list(p->next ? p->next : NULL);
	}
}

int main()
{
	struct item* first;

	first = fill_int_list(5, 0);

	int x = intlist_reduce_r(&int_plus, 0, first);
	// int x = intlist_reduce_l(&int_plus, 0, first); // same result

	print_int_list(first); // 0 1 2 3 4

	printf("\n%d", x); // 10

    return 0;
}
```
[Back to TOC](#contents-)