def particao(lista, inicio, fim):
    pivo = lista[fim]
    pos = inicio

    for i in range (inicio, fim):
        if lista[i] <= pivo:
            lista[i], lista[pos] = lista[pos], lista[i]
            pos += 1
    lista[pos], lista[fim] = lista[fim], lista[pos]
    return pos

def quick(lista, inicio, fim):
    if inicio < fim:
        pospivo = particao(lista, inicio, fim)
        quick(lista, inicio, pospivo -1)
        quick(lista, pospivo +1, fim)

def quicksort(lista):
    quick(lista, 0, len(lista)-1)

lista = [25, 72, 60, 19, 48, 31, 53, 40]
quicksort(lista)
print(lista)