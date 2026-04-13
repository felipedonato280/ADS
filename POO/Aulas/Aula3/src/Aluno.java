import java.util.Random;
import java.util.Scanner;

public class Aluno {

    // Atributos da classe Aluno, podem ser sem = pois sao atributos
    String nome;
    String cpf;
    String email;
    int matricula;
    String curso;
    String nascimento;
    String telefone;

    public void lerTeclado(){
        Random aleatorio = new Random();
        Scanner input = new Scanner(System.in);

        System.out.printf("Informe o nome do aluno: ");
        nome = input.nextLine();

        System.out.printf("Informe o CPF do aluno: ");
        cpf = input.nextLine();

        System.out.printf("Informe o Email do aluno: ");
        email = input.nextLine();

        System.out.printf("Informe o numero de matricula do aluno: \n");
        matricula = aleatorio.nextInt(0,10000);
        //input.nextLine();

        System.out.printf("Informe o curso do aluno: ");
        curso = input.nextLine();

        System.out.printf("Informe a data de nascimento do aluno: ");
        nascimento = input.nextLine();

        System.out.printf("Informe o telefone do aluno: ");
        telefone = input.nextLine();
    }

    public String transformaEmString(){
        // Precisa do = pois é variavel
        String saida = "";

        saida = saida + "Nome: " + nome + "\n";
        saida += "CPF: " + cpf + "\n";
        saida += "Email: " + email + "\n";
        saida += "Numero de matricula: " + matricula + "\n";
        saida += "Curso: " + curso + "\n";
        saida += "Data de nascimento: " + nascimento + "\n";
        saida += "Telefone: " + telefone + "\n \n";

        return saida;
    }

    public static void main(String[] args){
        Aluno al01 = new Aluno();
        al01.lerTeclado();

        Aluno al02 = new Aluno();
        al02.lerTeclado();

        /*
        al01.nome = "Felipe";
        al01.cpf = "111.111.111-22";
        al01.email = "felipedonato280@gmail.com";
        al01.matricula = 11122;
        al01.curso = "Tads";
        al01.nascimento = "26/10/2005";
        al01.telefone = "51 998661432";

        Aluno al02 = new Aluno();
        al02.nome = "Rafaela";
        al02.cpf = "111.111.111-22";
        al02.email = "Rafaela@gmail.com";
        al02.matricula = 11122;
        al02.curso = "Tads";
        al02.nascimento = "09/05/2005";
        al02.telefone = "51 997676082";
         */
        System.out.printf(al01.transformaEmString().toUpperCase());
        System.out.printf(al02.transformaEmString());
    }
}
