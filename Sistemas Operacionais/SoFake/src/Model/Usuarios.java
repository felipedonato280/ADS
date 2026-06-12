package Model;

public class Usuarios {
    private String usuario;
    private String senha;

    // Getters and Setters
    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getSenha() {
        return senha;
    }

    private void setSenha(String senha) {
        this.senha = senha;
    }

    public Usuarios(String usuario, String senha) {
        setUsuario(usuario);
        setSenha(senha);
    }
}