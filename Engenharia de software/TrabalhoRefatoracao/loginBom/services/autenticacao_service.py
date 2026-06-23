from models.usuario import Usuario
from repositories.usuario_repository import UsuarioRepository
from security.password_manager import PasswordManager

class AutenticacaoService:

    def __init__(
        self,
        repository: UsuarioRepository
    ):
        self.repository = repository

    def cadastrar_usuario(
        self,
        nome_usuario: str,
        senha: str
    ) -> bool:

        usuario_existente = (
            self.repository.buscar_por_nome(
                nome_usuario
            )
        )

        if usuario_existente:
            return False

        senha_hash = (
            PasswordManager.gerar_hash(senha)
        )

        usuario = Usuario(
            nome_usuario=nome_usuario,
            senha_hash=senha_hash
        )

        self.repository.salvar(usuario)

        return True

    def autenticar(
        self,
        nome_usuario: str,
        senha: str
    ) -> bool:

        usuario = (
            self.repository.buscar_por_nome(
                nome_usuario
            )
        )

        if usuario is None:
            return False

        return PasswordManager.verificar_senha(
            senha,
            usuario.senha_hash
        )