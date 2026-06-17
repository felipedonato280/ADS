public class Disciplina {

    private String nomeDisc;
    private Professor prof;
    private int cargaHoraria;

    public Disciplina(String nomeDisc, Professor prof, int cargaHoraria){
        this.nomeDisc = nomeDisc;
        setProf(prof);
        setCargaHoraria(cargaHoraria);
    }

    public String getNomeDisc() {
        return nomeDisc;
    }

    public int getCargaHoraria() {
        return cargaHoraria;
    }

    public void setProf(Professor prof){
        this.prof = prof;
    }

    public void setCargaHoraria(int cargaHoraria){
        if(cargaHoraria > 0 && cargaHoraria <= 120){
            this.cargaHoraria = cargaHoraria;
        }
        else{
            System.out.println("Carga Horaria invalida! ");
            this.cargaHoraria = 0;
        }
    }

    @Override
    public String toString(){
        return "NOME DA DISCIPLINA: " + nomeDisc + "\n" +
                "PROFESSOR: " + prof.getNome() + "\n" +
                "CH: " + cargaHoraria + "\n";
    }

    /*public static void main(String[] args){
        Professor p1 = new Professor("Marchesan silva", "919.960.290-37", "marchesan@gmail.com");
        Professor p2 = new Professor("Fabio silva", "919.960.290-37", "fabio@gmail.com");

        Disciplina d1 = new Disciplina("matematica", p1, 120);

        d1.setProf(p2);

        System.out.println(d1.toString());
    }*/
}