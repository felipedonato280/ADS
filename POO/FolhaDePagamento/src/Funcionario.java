import java.util.Scanner;

public class Funcionario{
    private String nome;
    private String cpf;
    private float salario;
    private String cargo;

    // CONSTRUCTOR

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

    // CONSTRUCTOR OVERLOAD

    public Funcionario(String nome, String cpf, float salario, String cargo){
        this(nome, cpf, salario);

        setCargo(cargo);
    }

    // METODOS PRINCIPAIS

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

    // SETTERS

    public void setNome(String nome){
        if(nome != null && !nome.isEmpty()){
            this.nome = nome;
        }
        else{
            this.nome = "Nome não informado";
        }
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

    public void setCargo(String cargo){
        if(cargo.length() > 5){
            this.cargo = cargo;
        }
        else{
            this.cargo = "Cargo Indefinido";
        }
    }

    // GETTERS

    public String getNome(){
        return nome;
    }

    public String getCPF(){
        return cpf;
    }

    public float getSalario(){
        return salario;
    }

    public String getCargo(){
        return cargo;
    }

    public static void main(String[] args){
        Funcionario Func1 = new Funcionario("Felipe", "54669825411", 1820.50f, "TI");
        Funcionario Func2 = new Funcionario("Rafaela", "89654721568", 2520.50f);
        Funcionario Func3 = new Funcionario("Joao", "45871325846", 5500.99f, "Atendente");

        System.out.println(Func1.toString());
        System.out.println(Func2.toString());
        System.out.println(Func3.toString());
    }
}