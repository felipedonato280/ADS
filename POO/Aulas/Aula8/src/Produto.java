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
        Produto prod01 = new Produto(101, "Coca Lata", "Bebidas", 2f);
        Produto prod02 = new Produto(102, "Leite", "Bebidas", 1.50f, 6.50f);
        Produto prod03 = new Produto(103, "Doritos", "Salgadinhos", 3f, 12.50f);
        Produto prod04 = new Produto(104, "Oreo", "Bolachas", 1.20f, 3f);
        Produto prod05 = new Produto(105, "Ovos", "Outros", 1.99f, 11.99f);
        Produto prod06 = new Produto(106, "Maça", "Frutas", 5.40f, 13f);
        Produto prod07 = new Produto(107, "Carne", "Carnes", 25.50f, 42.80f);
        Produto prod08 = new Produto(108, "Água", "Bebidas", 0.20f, 1.50f);

        System.out.println(prod01.toString());
        System.out.println(prod02.toString());
        System.out.println(prod03.toString());
        System.out.println(prod04.toString());
        System.out.println(prod05.toString());
        System.out.println(prod06.toString());
        System.out.println(prod07.toString());
        System.out.println(prod08.toString());
    }
}