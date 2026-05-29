import java.util.HashSet;
import java.util.Random;
import java.util.Set;

public class Professor {
    private String nome;
    private String cpf;
    private String email;
    private int matricula;

    private static Set<Integer> matriculasUsadas = new HashSet<>();

    public Professor(String nome, String cpf, String email){
        if(nome != null && !nome.isEmpty()){
            this.nome = nome;
        }
        else{
            System.out.println("O nome informado esta incorreto! ");
            this.nome = "Nome nao informado";
        }

        if(CpfCnpjUtils.isValidCPF(cpf)){
            this.cpf = cpf;
        }
        else {
            System.out.println("O CPF " + cpf + " é inválido. Verifique a informação");
            this.cpf = "CPF invalido";
        }

        setEmail(email);

        setMatricula();
    }

    public void setEmail(String email){
        if(email.length() > 8 && email.contains("@gmail.com")){
            this.email = email;
        }
        else{
            System.out.println("O email digitado esta incorreto! ");
            this.email = "Email invalido";
        }
    }

    public String getEmail(){
        return email;
    }

    public  void setMatricula(){
        Random random = new Random();
        int numero;

        do{
            numero = random.nextInt(1, 100000);
        }
        while(matriculasUsadas.contains(numero));

        matriculasUsadas.add(numero);

        this.matricula = numero;
    }

    public int getMatricula(){
        return matricula;
    }

    @Override
    public String toString(){
        return "Professor: " + nome + "\n" +
                "CPF: " + cpf + "\n" +
                "EMAIL: " + email + "\n" +
                "MATRICULA: " + matricula + "\n";
    }

    public static void main(String[] args){
        Professor p1 = new Professor("Felipe", "123", "teste@gmail.com");
        Professor p2 = new Professor("Joao", "456", "joao@gmail.com");

        System.out.println(p1.toString());
        System.out.println(p2.toString());
    }
}
