from repositories.usuario_repository import UsuarioRepository
from services.autenticacao_service import AutenticacaoService


def exibir_menu() -> str:
    print("\n=== SISTEMA DE LOGIN ===")
    print("1 - Login")
    print("2 - Cadastrar")
    print("3 - Sair")

    return input("Opção: ").strip()


def realizar_login(
    service: AutenticacaoService
) -> None:

    nome_usuario = input(
        "Usuário: "
    ).strip()

    senha = input(
        "Senha: "
    ).strip()

    if service.autenticar(
        nome_usuario,
        senha
    ):
        print("Login realizado com sucesso.")
    else:
        print("Usuário ou senha inválidos.")


def cadastrar_usuario(
    service: AutenticacaoService
) -> None:

    nome_usuario = input(
        "Novo usuário: "
    ).strip()

    senha = input(
        "Senha: "
    ).strip()

    sucesso = service.cadastrar_usuario(
        nome_usuario,
        senha
    )

    if sucesso:
        print("Usuário cadastrado.")
    else:
        print("Usuário já existe.")


def main() -> None:

    repository = UsuarioRepository()

    service = AutenticacaoService(
        repository
    )

    while True:

        opcao = exibir_menu()

        match opcao:
            case "1":
                realizar_login(service)

            case "2":
                cadastrar_usuario(service)

            case "3":
                print("Encerrando...")
                break

            case _:
                print("Opção inválida.")


if __name__ == "__main__":
    main()