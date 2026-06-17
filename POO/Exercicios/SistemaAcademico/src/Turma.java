import java.util.ArrayList;

public class Turma {

    private final Disciplina disc;
    private final ArrayList<Aluno> alunos;
    private final ArrayList<Data> encontros;
    private int qtdMatriculados;

    private static final int TAMANHO_TURMA = 35;

    public Turma(Disciplina disc){
        this.disc = disc;
        this.alunos = new ArrayList<>();
        this.encontros = new ArrayList<>();

        qtdMatriculados = 0;
    }

    public void adicionarEncontro(Data encontro){
        encontros.add(encontro);
    }

    public void adicionarAluno(Aluno aluno){
        if(qtdMatriculados < TAMANHO_TURMA){
            alunos.add(aluno);
            qtdMatriculados ++;
            System.out.println("Aluno " + aluno.getNome() + " Adicionado a turma");
        }
        else{
            System.out.println("Limite de " + TAMANHO_TURMA + " da turma atingido");
        }
    }

    public String mostrarAlunos(){
        StringBuilder sb = new StringBuilder();

        for(Aluno aluno : alunos){
            sb.append(aluno.getNome()).append("\n");
        }

        return sb.toString();
    }

    public String mostrarEncontros(){
      StringBuilder sb = new StringBuilder();

        for(Data encontro : encontros){
            sb.append(encontro.escreverAbreviado()).append("\n");
        }

        return sb.toString();
    }

    public String mostrarRelatorio(){
        return  "\nDISCIPLINA:\n" + disc +
                "\nALUNOS:\n" + mostrarAlunos() +
                "\nENCONTROS:\n" + mostrarEncontros();
    }

    @Override
    public String toString(){
        return mostrarRelatorio();
    }
}