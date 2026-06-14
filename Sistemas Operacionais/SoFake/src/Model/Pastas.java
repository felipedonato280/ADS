package Model;

import java.util.ArrayList;

public class Pastas {
    protected String nome;
    protected int peso;
    protected ArrayList <Conteudo> conteudos = new ArrayList<>();

    public Pastas(String nome, int peso){
        setNome(nome);
        setPeso(peso);
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setPeso(int peso){
        this.peso = peso;
    }

    public void setConteudo(Conteudo conteudo){
        conteudos.add(conteudo);
    }

    public void mostrarConteudo() {
        System.out.println("=== " + nome + " ===");
        for (Conteudo c : conteudos) {
            System.out.println(c.getTexto());
        }
    }

    public void limparConteudos() {
        conteudos.clear();
    }

    public String getNome(){
        return nome;
    }

    public int getPeso(){
        return peso;
    }

    public ArrayList<Conteudo> getConteudos() {
        return new ArrayList<>(conteudos); // retorna cópia para não expor direto
    }

    public boolean estaVazia() {
        return conteudos.isEmpty();
    }
}