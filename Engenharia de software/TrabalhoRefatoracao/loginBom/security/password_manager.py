import bcrypt


class PasswordManager:
    @staticmethod
    def gerar_hash(senha: str) -> str:
        senha_bytes = senha.encode("utf-8")

        hash_gerado = bcrypt.hashpw(
            senha_bytes,
            bcrypt.gensalt()
        )

        return hash_gerado.decode("utf-8")

    @staticmethod
    def verificar_senha(
        senha: str,
        senha_hash: str
    ) -> bool:
        return bcrypt.checkpw(
            senha.encode("utf-8"),
            senha_hash.encode("utf-8")
        )