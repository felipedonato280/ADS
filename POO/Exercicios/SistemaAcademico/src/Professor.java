import java.util.HashSet;
import java.util.Random;
import java.util.Set;

public class Professor {
    private String nome;
    private String cpf;
    private String email;
    private final int matricula;

    private static final Set<Integer> matriculasUsadas = new HashSet<>();

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

        this.matricula = gerarMatricula();
    }

    public String getNome(){
        return nome;
    }

    public String getEmail(){
        return email;
    }

    public int getMatricula(){
        return matricula;
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

    private int gerarMatricula(){
        Random random = new Random();
        int numero;

        do{
            numero = random.nextInt(1, 100000);
        }
        while(matriculasUsadas.contains(numero));

        matriculasUsadas.add(numero);

        return numero;
    }

    @Override
    public String toString(){
        return "PROFESSOR: " + nome + "\n" +
                "CPF: " + cpf + "\n" +
                "EMAIL: " + email + "\n" +
                "MATRICULA: " + matricula + "\n";
    }

    public static void main(String[] args){
        Professor p1 = new Professor("Marchesan", "123", "marchesan@gmail.com");
        Professor p2 = new Professor("Fabio", "456", "fabio@gmail.com");
        Professor p3 = new Professor("Marco", "000", "marco@gmail.com");
        Professor p4 = new Professor("Victor", "333", "victor@gmail.com");

        System.out.println(p1.toString());
        System.out.println(p2.toString());
        System.out.println(p3.toString());
        System.out.println(p4.toString());

        System.out.println(matriculasUsadas);
    }
}
