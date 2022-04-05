#include "array_list_int.h"
#include <stdlib.h>

struct array_list_int{
  int *a; // define um ponteiro
  unsigned int size; // representa a quantidade de elementos na lista
  unsigned int capacity; // representa o espaço alocado para a lista
};



array_list_int * array_list_create(){
  // cria uma variavel do tipo array_list_int  e aloca espaço em memória
  array_list_int *new_list = (array_list_int*)malloc(sizeof(array_list_int)); 

   // o ponteiro a aponta para o inicio do espaço de memória alocado anteriormente 
  (*new_list).a = (int*)malloc(sizeof(int)*2);


  // adicona ao size do struct criado
  (*new_list).size = 0; 

  // adicona ao size do struct criado
  (*new_list).capacity = 2; 

  // retorna a a variavel do tipo complexo array_list_int
  return new_list; 
}

int array_list_get(array_list_int *list, int index, int *error){
  // altera o valo do local de memória onde o ponteiro *error aponta, sendo 1 o estado padrão sendo retornado caso algo durante a execução  da função
  *error = 1; 

  // artibui a variavel value o valor contido no espaço de memoria apontado
  int value = (*list).a[index]; 

  // atribui o valor 0 ao local de memóra apontado pelo ponteiro *error representando que não houve erros durante a execução
  *error = 0; 
  
  // retorna o valor da variavel value, que representa o valor do lista que tem como indice o valor contido na variavel index
  return value; 
}

unsigned int array_list_push_back(array_list_int *list, int i){
  // atribui ao primeiro espaço de memoria disponivel na lista o valor de i
  (*list).a[(*list).size] = i; 

  // incrementa um ao valor a quantidade de elementos na lista
  (*list).size++; 
  
  // retorna a quantidade de elementos na lista
  return array_list_size(list); 
}

unsigned int array_list_pop_back(array_list_int * list){
  // atribui ao ultimo elemento da lista o valor ZERO, ou seja, deixando o espaço vazio
  (*list).a[(*list).size-1] = 0; 

  // decrementa um da quantidade de elementos da lista
  (*list).size--;

  // retorna o quantidade de elementos da lista 
  return array_list_size(list); 
}

unsigned int array_list_size(array_list_int * list){
    return (*list).size; // retorna o quantidade de elementos da lista 
}

int array_list_find(array_list_int * list, int element){
   // atribui -1 ao index para caso não o fluxo da função não passe pelo if o valor -1 será retornado indicando que o elemento não foi encontrado
  int index = -1,i;
  // Passa por todo a lista e verifica se o elemento do indice é igual ao valor de element
  for(i = 0; i < (*list).size; i++){ 
    if((*list).a[i] == element){
      index = i;
    }
  }
  // retorna o indice do elemento que tem valor igual ao contido na variavel element
  return index; 
  // big O = O(n)
}

unsigned int array_list_insert_at(array_list_int * list, int index, int value){ 
  //verfifica se a capacidade maxima do array já foi atingida
  if((*list).size == (*list).capacity){
    int i;
    // cria uma nova variavel para conter o valor da nova capacidade
    int new_capacity = (*list).capacity*2;
    // cria uma novo array mais espaco de memoria, com a nova capacidade
    int *new_list = (int*)malloc(sizeof(int)*new_capacity);
    // passa os elementos do antigo array para o novo array
    for(i = 0;i < (*list).size;i++){
      new_list[i] = (*list).a[i];
    }
    // o ponteiro que apontava para o inicio do espaço de memoria do array antigo agora aponta para o espaço de memoria do novo array
    array_list_destroy((*list).a);
    (*list).a = new_list;
    // o espaco de memoria apontado pelo ponteiro capacity agora contem o valor da nova capaity
    (*list).capacity = new_capacity;
  }
  // passa o valor recebido em value para o espaco de memoria apontado pelo index 
  (*list).a[index] = value;
  //incrementa o valor do espaço utilizado(size)
  (*list).size++;
  return 0;
  // big O = O(n)
}

int array_list_remove_from(array_list_int * list, int index){
  // muda para zero o valor do elemento apontado pelo indice recebido
  (*list).a[index] = 0;
  // decrementa UM do numero de elementos utlizados(size) 
  (*list).size--;
  return 0;
}

unsigned int array_list_capacity(array_list_int * list){
  // retorna o valor de CAPACITY, que representa a capacidade atual do array
  return (*list).capacity;
}

double array_list_percent_occupied(array_list_int * list){
  // retorna o valor em porcetagem da relaçao entre a quantidade de elementos utilizado e a capacidade maxima
  return ((double) (*list).size / (double)(*list).capacity);
}

void array_list_destroy(int *list){
  // libera o espaço utilizado pelo array
  free(list);
}






