n1 = int(input("Digite um numero: "))
n2 = int(input("Digite outro numero: "))
o = input("Operacao (+,-,*,/): ")

if o == "+":
    r = n1 + n2
    print("Resultado:", r)
elif o == "-":
    r = n1 - n2
    print("Resultado:", r)
elif o == "*":
    r = n1 * n2
    print("Resultado:", r)
elif o == "/":
    if n2 != 0:
        r = n1 / n2
        print("Resultado:", r)
    else:
        print("Erro")
else:
    print("Operacao invalida")