#include <stdio.h>

int main()
{

    int vetor[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int menor = vetor[0];

    for (int i = 0; i < 10; i++)
    {
        if (vetor[i] < menor)
            menor = vetor[i];
    }

    printf("MENOR ELEMENTO = %d", menor);

    return 0;
}