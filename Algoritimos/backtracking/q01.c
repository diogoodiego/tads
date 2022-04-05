#include <stdio.h>
int counter(int n, int x){
  if(n <= 0) return 0;
  else if(n%10 != x) return counter(n/10,x);
  return 1 + counter(n/10,x);
}
int main() {
  int value, n;
  
  printf("\nDigite o número inteiro: ");
  scanf("%d", &value);
  printf("\nDigite o algarismo buscado: ");
  scanf("%d", &n);

  printf("O algorismo %d ocorre %d vezes em %d.\n",n,counter(value,n),value);
  return 0;
}