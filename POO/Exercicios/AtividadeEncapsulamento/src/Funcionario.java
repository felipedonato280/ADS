import java.util.Scanner;

public class Funcionario{
    private String nome;
    private String cpf;
    private float salario;
    private String cargo;

    //public Funcionario(){}

    public Funcionario(String nome, String cpf, float salario){
        setNome(nome);

        if (CpfCnpjUtils.isValidCPF(cpf)){
            this.cpf = cpf;
        } else {
            System.out.printf("O CPF %s é inválido. Verifique a informação \n", cpf);
            this.cpf = "";
        }

        setSalario(salario);
    }

    public Funcionario(String nome, String cpf, float salario, String cargo){
        setNome(nome);

        if (CpfCnpjUtils.isValidCPF(cpf)){
            this.cpf = cpf;
        } else {
            System.out.printf("O CPF %s é inválido. Verifique a informação \n", cpf);
            this.cpf = "";
        }

        setSalario(salario);
        setCargo(cargo);
    }

    public void setNome(String nome){
        if(nome != null && !nome.isEmpty()){
            this.nome = nome;
        }
        else{
            this.nome = "Nome não informado";
        }
    }

    public String getNome(){
        return nome;
    }

    public String getCPF(){
        return cpf;
    }

    public void setSalario(float salario){
        if(salario >= 1621){
            this.salario = salario;
        }
        else{
            System.out.println("Salario invalido");
            this.salario = 0.50f;
        }
    }

    public float getSalario(){
        return salario;
    }

    public void setCargo(String cargo){
        if(cargo.length() > 5){
            this.cargo = cargo;
        }
        else{
            this.cargo = "Assistente em Administração";
        }
    }

    public String getCargo(){
        return cargo;
    }

    public void lerFuncionario(){
        Scanner input = new Scanner(System.in);

        System.out.println("Digite o seu nome: ");
        nome = input.nextLine();

        System.out.println("Digite o seu CPF: ");
        cpf = input.nextLine();

        System.out.println("Digite o seu salario: ");
        salario = input.nextFloat();

        input.nextLine();

        System.out.println("Digite o seu cargo: ");
        cargo = input.nextLine();
    }

    public String toString(){
        String saidaM1 = "";
        saidaM1 += "Nome: " + nome + "\n";
        saidaM1 += "CPF: " + cpf + "\n";
        saidaM1 += "Salario: " + salario + "\n";
        saidaM1 += "Cargo: " + cargo + "\n";

        String saidaM2 = "";
        saidaM2 += "Nome: " + nome + "\n";
        saidaM2 += "CPF: " + cpf + "\n";
        saidaM2 += "Salario: " + salario + "\n";

        if (cargo == null)
            return saidaM2;

        return saidaM1;
    }

    public static void main(String[] args){
        Funcionario Func1 = new Funcionario("Felipe", "54669825411", 1820.50f, "TI");
        Funcionario Func2 = new Funcionario("Rafaela", "89654721568", 2520.50f);
        Funcionario Func3 = new Funcionario("Joao", "45871325846", 5500.99f, "Atendente");

        //Funcionario Func1 = new Funcionario();
        //Func1.lerFuncionario();

        //Funcionario Func2 = new Funcionario();
        //Func2.lerFuncionario();

        //Funcionario Func3 = new Funcionario();
        //Func3.lerFuncionario();

        System.out.println(Func1.toString());
        System.out.println(Func2.toString());
        System.out.println(Func3.toString());
    }
}

/*
import java.util.Scanner;

public class Funcionario {
    String nome;
    long cpf;
    float salario;
    String cargo;

    public Funcionario() {
    }

    public void lerFuncionario(Scanner input){

        System.out.println("Digite o seu nome: ");
        nome = input.nextLine();

        System.out.println("Digite o seu CPF: ");
        cpf = input.nextLong();

        System.out.println("Digite o seu salario: ");
        salario = input.nextFloat();

        input.nextLine(); // limpa o ENTER

        System.out.println("Digite o seu cargo: ");
        cargo = input.nextLine();
    }

    public String toString(){
        String saida = "";
        saida += "Nome: " + nome + "\n";
        saida += "CPF: " + cpf + "\n";
        saida += "Salario: " + salario + "\n";

        if (cargo != null && !cargo.isEmpty()){
            saida += "Cargo: " + cargo + "\n";
        }

        return saida;
    }

    public static void main(String[] args){

        Scanner input = new Scanner(System.in);

        Funcionario[] funcionarios = new Funcionario[3];

        // leitura dos dados
        for(int i = 0; i < funcionarios.length; i++){
            System.out.println("\nFuncionario " + (i+1));

            funcionarios[i] = new Funcionario();
            funcionarios[i].lerFuncionario(input);
        }

        // impressão dos dados
        System.out.println("\n--- Funcionarios cadastrados ---");

        for(int i = 0; i < funcionarios.length; i++){
            System.out.println(funcionarios[i]);
        }

    }
}
*/