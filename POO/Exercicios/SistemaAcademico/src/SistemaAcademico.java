public class SistemaAcademico {
    public static void main(String[] args){
        Data encontro1 = new Data(1, 4, 2026);
        Data encontro2 = new Data(8, 4, 2026);

        Aluno al01 = new Aluno("Carlos Augusto", "919.960.290-37", "carlos@gmail.com", Aluno.CURSO_TPG, new Data(21, 8, 2020));
        Aluno al02 = new Aluno("Felipe Donato", "556.161.350-20", "felipe@gmail.com", Aluno.CURSO_ADS, new Data(14, 8, 2009));
        Aluno al03 = new Aluno("Gustavo Guanabara", "315.339.860-70", "gustavo@ymail.com", Aluno.CURSO_ADS, new Data (21, 12, 2006));

        Professor p1 = new Professor("Marchesan silva", "919.960.290-37", "marchesan@gmail.com", "20");

        Disciplina d1 = new Disciplina("Banco de dados 2", p1, 80);

        Turma turma1 = new Turma(d1);

        turma1.adicionarEncontro(encontro1);
        turma1.adicionarEncontro(encontro2);

        turma1.adicionarAluno(al01);
        turma1.adicionarAluno(al02);
        turma1.adicionarAluno(al03);

        //System.out.println(turma1.mostrarAlunos());
        //System.out.println(turma1.mostrarEncontros());
        System.out.println(turma1);
        //System.out.println(p1);
    }
}