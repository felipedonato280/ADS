import java.util.Scanner;

public class Funcionario{
    String nome;
    long cpf;
    float salario;
    String cargo;

    //public Funcionario(){}

    public Funcionario(String nome, long cpf, float salario){
        this.nome = nome;
        this.cpf = cpf;
        this.salario = salario;
    }

    public Funcionario(String nome, long cpf, float salario, String cargo){
        this.nome = nome;
        this.cpf = cpf;
        this.salario = salario;
        this.cargo = cargo;
    }

    /*
    public void lerFuncionario(){
        Scanner input = new Scanner(System.in);

        System.out.println("Digite o seu nome: ");
        nome = input.nextLine();

        System.out.println("Digite o seu CPF: ");
        cpf = input.nextLong();

        System.out.println("Digite o seu salario: ");
        salario = input.nextFloat();

        input.nextLine();

        System.out.println("Digite o seu cargo: ");
        cargo = input.nextLine();
    }
    */

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
        Funcionario Func1 = new Funcionario("Felipe", 54669825411L, 1820.50f, "TI");
        Funcionario Func2 = new Funcionario("Rafaela", 89654721568L, 2520.50f);
        Funcionario Func3 = new Funcionario("Joao", 45871325846L, 5500.99f, "Atendente");

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