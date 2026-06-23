import json
from pathlib import Path

from models.usuario import Usuario


class UsuarioRepository:

    def __init__(self):
        self.arquivo = Path("data/usuarios.json")

    def listar(self) -> list[Usuario]:
        if not self.arquivo.exists():
            return []

        with open(
            self.arquivo,
            "r",
            encoding="utf-8"
        ) as arquivo:
            dados = json.load(arquivo)

        return [
            Usuario(**usuario)
            for usuario in dados
        ]

    def buscar_por_nome(
        self,
        nome_usuario: str
    ) -> Usuario | None:

        for usuario in self.listar():
            if usuario.nome_usuario == nome_usuario:
                return usuario

        return None

    def salvar(
        self,
        usuario: Usuario
    ) -> None:

        usuarios = self.listar()

        usuarios.append(usuario)

        with open(
            self.arquivo,
            "w",
            encoding="utf-8"
        ) as arquivo:

            json.dump(
                [u.__dict__ for u in usuarios],
                arquivo,
                indent=4,
                ensure_ascii=False
            )