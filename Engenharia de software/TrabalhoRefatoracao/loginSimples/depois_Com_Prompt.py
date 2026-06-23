from dataclasses import dataclass
from typing import Dict, Optional


@dataclass
class Usuario:
    """
    Representa um usuário do sistema.
    """
    nome_usuario: str
    senha: str


class SistemaAutenticacao:
    """
    Responsável por gerenciar usuários e autenticação.
    """

    def __init__(self) -> None:
        self._usuarios = self._carregar_usuarios()

    def _carregar_usuarios(self) -> Dict[str, Usuario]:
        """
        Carrega os usuários iniciais do sistema.

        Returns:
            Dict[str, Usuario]: Dicionário indexado pelo nome do usuário.
        """
        usuarios = [
            Usuario("felipe", "123"),
            Usuario("maria", "abc"),
            Usuario("joao", "senha123"),
        ]

        return {
            usuario.nome_usuario: usuario
            for usuario in usuarios
        }

    def obter_usuario(self, nome_usuario: str) -> Optional[Usuario]:
        """
        Busca um usuário pelo nome.

        Args:
            nome_usuario: Nome do usuário.

        Returns:
            Usuario | None
        """
        return self._usuarios.get(nome_usuario)

    def validar_credenciais(
        self,
        nome_usuario: str,
        senha_informada: str
    ) -> bool:
        """
        Valida as credenciais de acesso.

        Args:
            nome_usuario: Nome do usuário.
            senha_informada: Senha digitada.

        Returns:
            bool: True se as credenciais forem válidas.
        """
        usuario = self.obter_usuario(nome_usuario)

        if usuario is None:
            return False

        return usuario.senha == senha_informada

    def executar_login(self) -> None:
        """
        Executa o fluxo de autenticação.
        """
        print("=== SISTEMA DE LOGIN ===")

        nome_usuario = input("Nome: ").strip()
        senha = input("Senha: ").strip()

        autenticado = self.validar_credenciais(
            nome_usuario,
            senha
        )

        if autenticado:
            print("Login realizado com sucesso!")
        else:
            print("Falha na autenticação.")


def main() -> None:
    """
    Ponto de entrada da aplicação.
    """
    sistema_autenticacao = SistemaAutenticacao()
    sistema_autenticacao.executar_login()


if __name__ == "__main__":
    main()