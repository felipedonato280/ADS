public class Produto {
    String nome;
    float precoCompra;
    float precoVenda;
    int codigo;
    String descricao;

    public Produto(int codigo, String nome, String descricao, float precoCompra){
        if(codigo > 0){
            this.codigo = codigo;
        }
        else{
            System.out.println("Codigo do produto invalido");
            this.codigo = 0;
        }

        if(nome != null && !nome.isEmpty()){
            this.nome = nome;
        }
        else{
            System.out.println("O nome digitado é invalido: ");
            this.nome = "Nome não informado";
        }

        if(descricao != null && !descricao.isEmpty()){
            this.descricao = descricao;
        }
        else{
            System.out.println("A descrição digitada é invalida: ");
            this.descricao = "Descriçao não informada";
        }

        if(precoCompra > 0){
            this.precoCompra = precoCompra;
            this.precoVenda = precoCompra * 1.5f;
        }
        else{
            System.out.println("O valor digitado é invalido! ");
            this.precoCompra = 0;
            this.precoVenda = 0;
        }
    }

    public Produto(int codigo, String nome, String descricao, float precoCompra, float precoVenda){
        this(codigo, nome, descricao, precoCompra);

        if(precoVenda > 0){
            this.precoVenda = precoVenda;
        }
        else{
            this.precoVenda = 0;
        }
    }

    public String toString(){
        return  "ID: " + codigo + "\n" +
                "Nome: " + nome + "\n" +
                "Descriçao: " + descricao + "\n" +
                "Preco de compra: " + precoCompra + "\n" +
                "Preco de venda: " + precoVenda + "\n";
    }

    public static void main(String[] args){
        Produto prod01 = new Produto(100, "Coca Lata", "Bebidas", 2f);
        Produto prod02 = new Produto(101, "Leite", "Bebidas", 1.5f, 6.5f);

        System.out.println(prod01.toString());
        System.out.println(prod02.toString());
    }
}