public class Main {
    public static void main(String[] args) {
        Filho filho = new Filho("Pedro Costa", "556.161.350-20");

        Funcionario funcionario = new Funcionario("Eduardo Henrique da Silva", "919.960.290-37", 4000f, "Analista de Sistemas Sênior");
        Funcionario funcionario2 = new Funcionario("Felipe Donato Silveira", "919.960.290-37", 6000f, "Analista de dados");
        Funcionario funcionario3 = new Funcionario("Maria Fernanda Costa", "556.161.350-20", 10000f, "Gerente de Projetos");

        funcionario3.adicionarFilho(filho);

        FolhaDePagamento folha = new FolhaDePagamento(funcionario);
        FolhaDePagamento folha2 = new FolhaDePagamento(funcionario2);
        FolhaDePagamento folha3 = new FolhaDePagamento(funcionario3);

        System.out.println(folha);
        System.out.println(folha2);
        System.out.println(folha3);
    }
}