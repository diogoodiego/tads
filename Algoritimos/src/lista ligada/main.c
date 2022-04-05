#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "linked_list_int.h"

int main(){
  int i, *error, index;
  clock_t inicio, fim;
  struct linked_list_int *li = linked_list_create();

  inicio = clock();

  for(i = 0; i < 800000 ;i++){
    linked_list_push_back(li, (rand()%1000));
  }



  for(i = 0; i < 300; i++){
    index = linked_list_find(li,(rand()%1000));
    if(index != -1){
      linked_list_remove_from(li,index);
    }
  }

  fim = clock();

  double tempo = (fim - inicio)/(CLOCKS_PER_SEC/1.0);
  fprintf(stderr,"Tempo decorrido: %lfs\n",tempo);
  return 0;
}