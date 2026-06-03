import java.util.HashSet;
import java.util.Random;
import java.util.Set;

public class Professor extends Pessoa {

    public Professor(String nome, String cpf, String email){
        super(nome, cpf, email);
    }

    @Override
    public String toString(){
        return "PROFESSOR: " + nome + "\n" +
                "CPF: " + cpf + "\n" +
                "EMAIL: " + email + "\n" +
                "MATRICULA: " + matricula + "\n";
    }

    public static void main(String[] args){
        Professor p1 = new Professor("Marchesan silva", "919.960.290-37", "marchesan@gmail.com");
        Professor p2 = new Professor("Fabio silva", "919.960.290-37", "fabio@gmail.com");
        Professor p3 = new Professor("Marco silva", "919.960.290-37", "marco@gmail.com");
        Professor p4 = new Professor("Victor silva", "919.960.290-37", "victor@gmail.com");

        System.out.println(p1);
        System.out.println(p2);
        System.out.println(p3);
        System.out.println(p4);

        System.out.println(matriculasUsadas);
    }
}
