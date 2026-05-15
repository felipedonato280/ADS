// Import necessário para leitura de dados via teclado
import java.util.Scanner;

public class Aluno {
    private String nome;
    private String cpf;
    private String email;
    private int matricula;
    private int curso;
    private Data nascimento;
    private String fone;

    private static int qtdAlunos;

    public static final int CURSO_TPG = 1;
    public static final int CURSO_ADS = 2;

    public Aluno(String nome, String cpf, String email, int cod_curso, Data nasc){

        String regex = "^[\\p{L}]+( [\\p{L}]+)+$";

        if (nome != null && nome.matches(regex) ) {
            this.nome = nome;
        } else {
            System.out.printf("O nome %s é invalidado, pois deve ter no mínimo duas partes \n", nome);
            this.nome = "Nome não informado";
        }

        setCurso(cod_curso);

        if (CpfCnpjUtils.isValidCPF(cpf)){
            this.cpf = cpf;
        } else {
            System.out.printf("O CPF %s é inválido. Verifique a informação \n", cpf);
            this.cpf = "";
        }

        setEmail(email);

        this.nascimento = nasc;

        qtdAlunos++;
    }

    public String getNome(){
        return nome;
    }

    public void setEmail(String email) {
        if (email.length() > 8) {
            this.email = email;
        } else {
            System.out.printf("O e-mail %s é inválido\n", email);
            this.email = "";
        }
    }

    public String getEmail() {
        return email;
    }


    public void setCurso(int curso) {
        if (curso > 0){
            this.curso = curso;
        } else {
            System.out.printf("Código de curso inválido. Verifique com o Setor de Registros Acadêmicos o código correto. \n");
            this.curso = 1;
        }
    }

    public int getCurso() {
        return curso;
    }

    public void lerTeclado(){
        Scanner sc = new Scanner(System.in);

        System.out.printf("Informe o nome do aluno: ");
        nome = sc.nextLine();

        System.out.printf("Informe o CPF do aluno: ");
        cpf = sc.nextLine();

        System.out.printf("Informe o e-mail do aluno: ");
        email = sc.nextLine();

        System.out.printf("Informe a matricula do aluno: ");
        matricula = sc.nextInt();

        sc.nextLine(); // consome a quebra de linha pendente

        // ALTERAÇÃO: leitura do curso agora é feita como número inteiro
        // O usuário deve informar um dos códigos definidos nas constantes
        System.out.printf("Informe o curso do aluno: ");
        curso = sc.nextInt();

        sc.nextLine(); // consome a quebra de linha pendente

        // System.out.printf("Informe a data de nascimento: ");
        /*
         * Não é possível ler a data de nascimento diretamente como String,
         * pois o atributo passou a ser do tipo Data.
         * Para isso, seria necessário ler dia, mês e ano separadamente
         * e instanciar um objeto Data com essas informações.
         */
        // nascimento = sc.nextLine();

        System.out.printf("Informe um telefone para contato: ");
        fone = sc.nextLine();
    }

    public String toString(){
        String saida = "";

        saida = saida + "Nome: " + nome + "\n";
        saida += "CPF: " + cpf + "\n";
        saida += "E-mail: " + email + "\n";
        saida += "Nº matricula: " + matricula + "\n";

        // ALTERAÇÃO: interpretação do código do curso para exibição textual
        // Em vez de imprimir o número, o código é traduzido para o nome do curso
        // O uso das constantes torna a leitura mais clara e evita erros
        if (curso == CURSO_TPG)
            saida += "Curso Superior de Tecnologia em Processos Gerenciais\n";
        else if (curso == CURSO_ADS)
            saida += "Curso Superior de Tecnologia em Análise e Desenvolvimento de Sistemas\n";
        else
            saida += "Curso não especificado\n";

        // Utiliza o metodo da classe Data para obter a data de nascimento formatada
        // e adiciona essa informação à saída do aluno
        saida += "Data de nascimento: " + nascimento.escreverAbreviado() + "\n";

        if (fone != null)
            saida += "Telefone para contato: " + fone + "\n \n";

        return saida;
    }

    public static String exibirQtdAlunos() {
        return "Atualmente existem " + qtdAlunos + " matriculas na instituição";
    }

    public static void main (String args[]) {

        Data nascimentoAluno01 = new Data(8, 4, 2005);
        nascimentoAluno01.setAno(2002);
        Aluno al01 = new Aluno("Carlos Augusto", "919.960.290-37", "carlos@gmail.com", Aluno.CURSO_TPG, nascimentoAluno01);
        al01.matricula = 202517645;

        Aluno al02 = new Aluno("Felipe Donato", "556.161.350-20", "felipe@gmail.com", Aluno.CURSO_ADS, new Data(14, 8, 2009));
        al02.matricula = 202517645;

        Aluno al03 = new Aluno("Gustavo Guanabara", "315.339.860-70", "gustavo@ymail.com", Aluno.CURSO_ADS, new Data (21, 12, 2006));
        al03.matricula = 202518644;

        System.out.printf("O aluno 1 nasceu no ano de %d \n\n", nascimentoAluno01.getAno() );

        System.out.println(al01.toString());
        System.out.println(al02.toString().toUpperCase());
        System.out.println(al03.toString());

        System.out.println(Aluno.exibirQtdAlunos());
    }
}