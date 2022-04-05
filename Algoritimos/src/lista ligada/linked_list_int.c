#include "linked_list_int.h"
#include <stdlib.h>
#include <stdio.h>


struct list_int_node{
  int value;
  struct list_int_node *prev;
  struct list_int_node *next;
};

struct linked_list_int{
  struct list_int_node *first;
  struct list_int_node *last;
  unsigned int size;
};

struct linked_list_int * linked_list_create(){
  struct linked_list_int *new_list = (struct linked_list_int*)malloc(sizeof(struct linked_list_int));
  new_list->first = 0;
  new_list->last = 0;
  new_list->size = 0;
  return new_list;
}

int linked_list_get(struct linked_list_int *list, int index, int *error){
  int i = 0;
  *error = 1;

  //verifica se o indice passado excede o tamanho da lista
  if(index >= list->size){
    return -1;
  }
  // criar nova estrutura que aponta para o primeiro elemento da lista
  struct list_int_node *current = list->first;

  // loop para percorrer a lista, passando o ponteiro do proximo elemento para o current 
  for(i = 0; i < index;i++){
    current = current->next;
  }

  // informa que não houve erros durante a  execução da função 
  *error = 0;

  // retorna o elemento com o indice recebido pela função
  return current->value;
  // função opera em O(n)
}

void linked_list_push_back(struct linked_list_int *list, int i){
  
  // cria um novo nó
  struct list_int_node *new_node = (struct list_int_node*)malloc(sizeof(struct list_int_node));

  // adicionar o valor de i ao valor contido no nó
  new_node->value = i;
  // define o valor do proximo no apontado pelo nó como vazio
  new_node->next = 0;
  // verifica se a lista já possui elementos
  if(list->last == 0){
    // se a lista não possui elementos o novo nó se torna o primeiro
    list->first = new_node;
  }
  else{
    // o ultimo elemento da lista aponta para o novo nó
    list->last->next = new_node;
  }
  // adiciona o nó no final da lista
  list->last = new_node;
  // incrementa o valor do número de elementos da lista
  list->size++;
  // a função opera em O(1)
}

unsigned int linked_list_pop_back(struct linked_list_int *list){
  if(list->size == 1){
    list->first = 0;
    list->last = 0;
    list->size = 0; 
    return 0;
  }

  if(list->first == 0){
    return 1;
  }
  int r = list->last->value;
  struct list_int_node *new_last = list->first;
  while (new_last->next != list->last){
    new_last = new_last->next;
  }
  new_last->next = 0;
  free(list->last);
  list->last = new_last;
  list->size--;
  return 0;
  // a função opera em O(n)
}



unsigned int linked_list_size(struct linked_list_int *list){
  return list->size;
}

int linked_list_find(linked_list_int * list, int element){
   // atribui -1 ao index para caso não o fluxo da função não passe pelo if o valor -1 será retornado indicando que o elemento não foi encontrado
  int index = -1,i;

  // criar nova estrutura que aponta para o primeiro elemento da lista
  struct list_int_node *current = list->first;

  // Passa por todo a lista e verifica se o elemento do indice é igual ao valor de element
  for(i = 0; i < list->size;i++){
    if(current->value == element){
      index = i;
    }
    current = current->next;
  }

  // retorna o indice do elemento que tem valor igual ao contido na variavel element
  return index; 
  // big O = O(n)
} 

unsigned int linked_list_insert_at(linked_list_int * list, int index, int value){
  int i;
  //verifica se o index recebido é maio que o tamanho da lista 
  if(list->size <= index){
    //aumenta o tamanho da lista até alcancar o indice
    for(i = list->size; i <= index; i++){
      linked_list_push_back(list, 0);
    }
  }
  
  // criar nova estrutura que aponta para o primeiro elemento da lista
  struct list_int_node *current = list->first;

  // Passa por todo a lista e verifica se o elemento do indice é igual ao valor de element
  for(i = 0; i < list->size;i++){
    if(i == index){
      current->value = value;
    }
    current = current->next;
  }
  return 0;
}


int linked_list_remove_from(linked_list_int * list, int index){
  int i;

  if(index == list->size - 1){
    linked_list_pop_back(list);
  }

  // criar nova estrutura que aponta para o primeiro elemento da lista
  struct list_int_node *current = list->first;

  // Passa por todo a lista e verifica se o i é igual ao indice anterior ao elemento que vai ser apagado
  for(i = 0; i <= index;i++){
    if(i == index - 1){
      // libera o espaço de memeoria o elemento removido
      free(current->next);
      // o next do elemento anterior ao elemento removido agora aponta para o proximo elemento após o elemento removido
      current->next = current->next->next;
      // o prev do elemento após o elemento removido agora aponta para o elemento anterior ao elemento removido
      current->next->prev = current;
    }
    current = current->next;
  }
  // decrementa UM do numero de elementos utlizados(size) 
  list->size--;
  return 0;
  // BigO = O(n)
}

void linked_list_destroy(linked_list_int * list){
  free(list);
}


void print_list(struct linked_list_int *list){
  struct list_int_node *current = list->first;
  printf("Lista: ");
  while(current != 0){
    printf(" %d ",current->value);
    current = current->next;
  }
  printf("\n");
}



