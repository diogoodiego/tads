def comb(n,k):
    print(f"comb({n},{k})")
    if n == k:
        return 1
    if k == 1:
        return n
    return comb(n-1,k-1) + comb(n-1,k)

print(comb(6,4))