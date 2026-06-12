package Model;

public class Conteudo {
    private String nome;
    private String texto;

    public Conteudo(String nome, String texto){
        setNome(nome);
        setTexto(texto);
    }

    public void setNome(String nome){
        this.nome = nome;
    }

    public void setTexto(String texto){
        this.texto = texto;
    }

    public String getNome(){
        return nome;
    }

    public String getTexto(){
        return texto;
    }

    @Override
    public String toString() {
        return nome + ": " + texto;
    }
}