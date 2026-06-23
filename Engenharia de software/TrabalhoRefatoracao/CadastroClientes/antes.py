clientes = []

while True:
    print("1 - Cadastrar")
    print("2 - Listar")
    print("3 - Buscar")
    print("4 - Sair")

    op = input("Opcao: ")

    if op == "1":
        n = input("Nome: ")
        i = int(input("Idade: "))
        e = input("Email: ")

        if len(n) > 0:
            if i > 0:
                if "@" in e:
                    clientes.append([n, i, e])
                    print("Cadastrado")
                else:
                    print("Email invalido")
            else:
                print("Idade invalida")
        else:
            print("Nome invalido")

    elif op == "2":
        if len(clientes) == 0:
            print("Sem clientes")
        else:
            for c in clientes:
                print("Nome:", c[0])
                print("Idade:", c[1])
                print("Email:", c[2])
                print("----------------")

    elif op == "3":
        nome = input("Digite o nome: ")

        achou = False

        for c in clientes:
            if c[0].lower() == nome.lower():
                print("Nome:", c[0])
                print("Idade:", c[1])
                print("Email:", c[2])
                achou = True

        if achou == False:
            print("Nao encontrado")

    elif op == "4":
        break

    else:
        print("Opcao invalida")