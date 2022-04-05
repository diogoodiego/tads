#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "array_list_int.h"

int main(){
  clock_t inicio, fim;
  array_list_int *a = array_list_create();
  int i, error,index;

  inicio = clock();
  for(i = 0; i < 800000; i++){
    array_list_insert_at(a, i, (rand()%1000));
  }

  for(i = 0; i < 29000; i++){
    index = array_list_find(a, (rand()%1000));
    if(index != -1){
      array_list_remove_from(a,index);
    }
  }
  fim = clock();

  double tempo = (fim - inicio)/(CLOCKS_PER_SEC/1.0);
  printf("Tempo decorrido: %.4lfs\n",tempo);
  printf("Porcentagem ocupada %lf\n",array_list_percent_occupied(a));
  getchar();
  return 0;
}
