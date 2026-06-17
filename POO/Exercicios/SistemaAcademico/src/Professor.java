public class Professor extends Pessoa {

    private String vinculo;
    private int cargaHoraria;
    private float salario;

    public Professor(String nome, String cpf, String email, String vinculo) {
        super(nome, cpf, email);
        setVinculo(vinculo);
    }

    public void setVinculo(String vinculo) {
        if (vinculo.equalsIgnoreCase("20") || vinculo.equalsIgnoreCase("40") || vinculo.equalsIgnoreCase("DE") ) {

            this.vinculo = vinculo;

            if (vinculo.equalsIgnoreCase("20") )
                this.cargaHoraria = 20;
            else
                this.cargaHoraria = 40;
        } else {
            this.vinculo = "Horista";
        }

        calcularSalario();
    }

    public void setCargaHoraria(int ch) {
        if (vinculo.equalsIgnoreCase("horista") && ch > 0) {
            cargaHoraria = ch;
            calcularSalario();
        } else {
            System.out.printf("Verifique se a carga horária informado é valida ou se o professor é horista. \n");
        }
    }

    private void calcularSalario() {

        if (vinculo.equalsIgnoreCase("20") )
            salario = 4500f;
        else if (vinculo.equalsIgnoreCase("40") )
            salario = 9000f;
        else if (vinculo.equalsIgnoreCase("DE") )
            salario = 13500f;
        else
        if (cargaHoraria > 0)
            salario = cargaHoraria * 80;
        else
            System.out.printf("Só é possível calcular o salário do professor horista se a carga horária trabalhada for maior que 0 horas\n");
    }

    public String getVinculo() {
        return vinculo;
    }

    public float getSalario() {
        return salario;
    }

    @Override
    public String toString(){
        return "PROFESSOR: " + nome + "\n" +
                "CPF: " + cpf + "\n" +
                "EMAIL: " + email + "\n" +
                "MATRICULA: " + matricula + "\n" +
                "VINCULO: " + vinculo + "\n" +
                "SALARIO: " + salario + "\n";
    }

    /*public static void main(String[] args){
        Professor p1 = new Professor("Marchesan silva", "919.960.290-37", "marchesan@gmail.com", "20");
        Professor p2 = new Professor("Fabio silva", "919.960.290-37", "fabio@gmail.com", "40");
        Professor p3 = new Professor("Marco silva", "919.960.290-37", "marco@gmail.com", "DE");
        Professor p4 = new Professor("Victor silva", "919.960.290-37", "victor@gmail.com","Horista");

        p4.setCargaHoraria(120);

        System.out.println(p1);
        System.out.println(p2);
        System.out.println(p3);
        System.out.println(p4);

        System.out.println(matriculasUsadas);
    }*/
}
