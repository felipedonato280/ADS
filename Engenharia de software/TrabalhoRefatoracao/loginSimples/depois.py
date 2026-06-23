from dataclasses import dataclass


@dataclass
class Usuario:
    nome_usuario: str
    senha: str


class SistemaAutenticacao:
    def __init__(self) -> None:
        self.usuarios = self._carregar_usuarios()

    def _carregar_usuarios(self) -> dict[str, Usuario]:
        usuarios = [
            Usuario("felipe", "123"),
            Usuario("maria", "abc"),
            Usuario("joao", "senha123"),
        ]

        return {
            usuario.nome_usuario: usuario
            for usuario in usuarios
        }

    def obter_usuario(self, nome_usuario: str) -> Usuario | None:
        return self.usuarios.get(nome_usuario)

    def autenticar(self, nome_usuario: str, senha: str) -> bool:
        usuario = self.obter_usuario(nome_usuario)

        if not usuario:
            return False

        return usuario.senha == senha

    def executar(self) -> None:
        print("=== SISTEMA DE LOGIN ===")

        nome_usuario = input("Nome: ").strip()
        senha = input("Senha: ").strip()

        mensagem = (
            "Login realizado com sucesso!"
            if self.autenticar(nome_usuario, senha)
            else "Falha na autenticação."
        )

        print(mensagem)


def main() -> None:
    sistema = SistemaAutenticacao()
    sistema.executar()


if __name__ == "__main__":
    main()