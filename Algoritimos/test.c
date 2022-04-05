#include <stdio.h>

int main(){

  int n;
  int menor;

  printf("Qual o tamanho do vetor?\n");
  scanf("%d",&n);

  int vetor[n];

  for(int i = 0; i < n; i++){
    printf("VETOR[%d] = ",i);
    scanf("%d",&vetor[i]);
  }

  menor = vetor[0];

  for(int i = 0; i < n; i++){
    if(vetor[i] < menor) menor = vetor[i];
  }

  printf("MENOR ELEMENTO = %d", menor);    

  return 0;
}  