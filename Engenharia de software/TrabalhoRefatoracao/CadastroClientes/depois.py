"""
Sistema simples de gerenciamento de clientes.

Permite:
- Cadastrar clientes
- Listar clientes
- Buscar clientes por nome
- Encerrar o sistema
"""


def validar_nome(nome: str) -> bool:
    """
    Valida se o nome foi informado.
    """
    return bool(nome.strip())


def validar_idade(idade: int) -> bool:
    """
    Valida se a idade é maior que zero.
    """
    return idade > 0


def validar_email(email: str) -> bool:
    """
    Validação básica de e-mail.
    """
    return "@" in email and "." in email


def obter_idade() -> int | None:
    """
    Solicita e valida a idade informada pelo usuário.
    """
    try:
        idade = int(input("Idade: "))
        return idade
    except ValueError:
        print("Idade inválida. Digite apenas números.")
        return None


def cadastrar_cliente(clientes: list[dict]) -> None:
    """
    Realiza o cadastro de um novo cliente.
    """
    nome = input("Nome: ").strip()

    if not validar_nome(nome):
        print("Nome inválido.")
        return

    idade = obter_idade()

    if idade is None or not validar_idade(idade):
        print("Idade inválida.")
        return

    email = input("Email: ").strip()

    if not validar_email(email):
        print("Email inválido.")
        return

    cliente = {
        "nome": nome,
        "idade": idade,
        "email": email
    }

    clientes.append(cliente)

    print("Cliente cadastrado com sucesso.")


def listar_clientes(clientes: list[dict]) -> None:
    """
    Exibe todos os clientes cadastrados.
    """
    if not clientes:
        print("Nenhum cliente cadastrado.")
        return

    print("\n=== CLIENTES CADASTRADOS ===")

    for cliente in clientes:
        print(f"Nome : {cliente['nome']}")
        print(f"Idade: {cliente['idade']}")
        print(f"Email: {cliente['email']}")
        print("-" * 30)


def buscar_cliente(clientes: list[dict]) -> None:
    """
    Busca clientes pelo nome.
    """
    nome_busca = input("Digite o nome: ").strip().lower()

    clientes_encontrados = [
        cliente
        for cliente in clientes
        if cliente["nome"].lower() == nome_busca
    ]

    if not clientes_encontrados:
        print("Cliente não encontrado.")
        return

    print("\n=== RESULTADO DA BUSCA ===")

    for cliente in clientes_encontrados:
        print(f"Nome : {cliente['nome']}")
        print(f"Idade: {cliente['idade']}")
        print(f"Email: {cliente['email']}")
        print("-" * 30)


def exibir_menu() -> None:
    """
    Exibe o menu principal.
    """
    print("\n=== SISTEMA DE CLIENTES ===")
    print("1 - Cadastrar cliente")
    print("2 - Listar clientes")
    print("3 - Buscar cliente")
    print("4 - Sair")


def executar_sistema() -> None:
    """
    Controla o fluxo principal da aplicação.
    """
    clientes = []

    while True:
        exibir_menu()

        opcao = input("Escolha uma opção: ").strip()

        match opcao:
            case "1":
                cadastrar_cliente(clientes)

            case "2":
                listar_clientes(clientes)

            case "3":
                buscar_cliente(clientes)

            case "4":
                print("Sistema encerrado.")
                break

            case _:
                print("Opção inválida.")


if __name__ == "__main__":
    executar_sistema()