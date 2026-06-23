from dataclasses import dataclass


@dataclass
class Usuario:
    nome_usuario: str
    senha_hash: str