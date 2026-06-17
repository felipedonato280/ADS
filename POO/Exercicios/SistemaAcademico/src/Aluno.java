public class Aluno extends Pessoa {
    private int curso;
    private Data nascimento;
    private String fone;

    private static int qtdAlunos;

    public static final int CURSO_TPG = 1;
    public static final int CURSO_ADS = 2;

    public Aluno(String nome, String cpf, String email, int cod_curso, Data nascimento){
        super(nome, cpf, email);

        setCurso(cod_curso);

        this.nascimento = nascimento;

        qtdAlunos++;
    }

    public int getCurso() {
        return curso;
    }

    public void setCurso(int curso) {
        if (curso > 0){
            this.curso = curso;
        } else {
            System.out.printf("Código de curso inválido. Verifique com o Setor de Registros Acadêmicos o código correto. \n");
            this.curso = 1;
        }
    }

    @Override
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

    /*public static void main (String args[]) {

        Data nascimentoAluno01 = new Data(8, 4, 2005);
        nascimentoAluno01.setAno(2002);
        Aluno al01 = new Aluno("Carlos Augusto", "919.960.290-37", "carlos@gmail.com", Aluno.CURSO_TPG, nascimentoAluno01);
        Aluno al02 = new Aluno("Felipe Donato", "556.161.350-20", "felipe@gmail.com", Aluno.CURSO_ADS, new Data(14, 8, 2009));
        Aluno al03 = new Aluno("Gustavo Guanabara", "315.339.860-70", "gustavo@ymail.com", Aluno.CURSO_ADS, new Data (21, 12, 2006));

        System.out.printf("O aluno 1 nasceu no ano de %d \n\n", nascimentoAluno01.getAno() );

        System.out.println(al01);
        System.out.println(al02.toString().toUpperCase());
        System.out.println(al03);

        System.out.println(Aluno.exibirQtdAlunos());
    }*/
}