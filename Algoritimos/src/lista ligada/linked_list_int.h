#ifndef _LINKED_LIST_INT_H_ 
#define _LINKED_LIST_INT_H_

typedef struct list_int_node list_int_node;

typedef struct linked_list_int linked_list_int;

linked_list_int * linked_list_create();

int linked_list_get(struct linked_list_int *list, int index, int *error);

void linked_list_push_back(struct linked_list_int *list, int i);

unsigned int linked_list_pop_back(struct linked_list_int *list);

unsigned int linked_list_size(struct linked_list_int *list);

int linked_list_find(linked_list_int * list, int element);

unsigned int linked_list_insert_at(linked_list_int * list, int index, int value);

int linked_list_remove_from(linked_list_int * list, int index);

void linked_list_destroy(linked_list_int * list);

void print_list(struct linked_list_int *list);

#endif
