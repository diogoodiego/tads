k = 1
while True:
    n = int(input())
    v = list(map,int(input().split()))
    r = ''
    numero = [0,1,2,3,4,5,6,7,8,9]
    oleo = [0.8,0.12,0.01,0.22,0.35,0.25,0.77,0.50,0.63,0.45]
    # for i in range(n):
        # for j in range(numero):
            if v[i] == oleo[j]:
                r += str(numero[j])
    print(f'Caso {k}: {r}')
            


