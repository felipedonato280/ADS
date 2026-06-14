package Model;

public class Usuarios {
    private String usuario;
    private String senha;

    public Usuarios(String usuario, String senha) {
        setUsuario(usuario);
        this.senha = senha;
    }

    public boolean autentica(String senhaDigitada) {
        return this.senha.equals(senhaDigitada);
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
}