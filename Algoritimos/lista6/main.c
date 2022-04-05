#include <stdio.h>
#include <time.h>

int sublista_soma_bt(int vetor[], int tamanho, int soma){
    if (soma < 0  || tamanho == 0) return 0;
    if (soma == 0) return 1;
    return sublista_soma_bt(vetor, tamanho - 1, soma - vetor[tamanho-1]) || sublista_soma_bt(vetor, tamanho - 1, soma);
}
// tamanaho 5, soma 41 -> tamanho 4, soma 29 -> tamanho 3, 

int main() {
    clock_t inicio, fim;
    int tamanho, soma;
    scanf("%d %d", &tamanho, &soma);
    int a[tamanho];
    for(int i = 0; i < tamanho; i++){
        a[i] = i;
    }
    inicio = clock();

    printf("%d\n",sublista_soma_bt(a, tamanho, soma));

    fim = clock();
    for(int i = 0; i < tamanho; i++){
        printf("%d ", a[i]);
    }
    printf("\n");
    double tempo = (fim - inicio)/(CLOCKS_PER_SEC/1.0);
    fprintf(stderr,"Tempo decorrido: %lfs\n",tempo);
}