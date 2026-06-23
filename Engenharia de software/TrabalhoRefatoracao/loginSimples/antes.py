class Usuario:
    def __init__(self, nome, senha):
        self.nome = nome
        self.senha = senha


class SistemaLogin:
    def __init__(self):
        self.usuarios = []
        self.carregar_usuarios()

    def carregar_usuarios(self):
        self.usuarios.append(Usuario("felipe", "123"))
        self.usuarios.append(Usuario("maria", "abc"))
        self.usuarios.append(Usuario("joao", "senha123"))

    def buscar_usuario(self, nome):
        for usuario in self.usuarios:
            if usuario.nome == nome:
                return usuario

        return None

    def autenticar(self, nome, senha):
        usuario = self.buscar_usuario(nome)

        if usuario is None:
            return False

        return usuario.senha == senha

    def iniciar(self):
        print("=== SISTEMA DE LOGIN ===")

        nome = input("Nome: ")
        senha = input("Senha: ")

        if self.autenticar(nome, senha):
            print("Login realizado com sucesso!")
        else:
            print("Falha na autenticação.")


sistema = SistemaLogin()
sistema.iniciar()