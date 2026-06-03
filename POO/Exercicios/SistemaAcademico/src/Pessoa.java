import java.util.HashSet;
import java.util.Random;
import java.util.Set;

public class Pessoa {
    protected String nome;
    protected String cpf;
    protected String email;
    protected final int matricula;

    protected static final Set<Integer> matriculasUsadas = new HashSet<>();

    public Pessoa(String nome, String cpf, String email){
        String regex = "^[\\p{L}]+( [\\p{L}]+)+$";

        if (nome != null && nome.matches(regex) ) {
            this.nome = nome;
        } else {
            System.out.printf("O nome %s é invalidado, pois deve ter no mínimo duas partes \n", nome);
            this.nome = "Nome não informado";
        }

        if (CpfCnpjUtils.isValidCPF(cpf)){
            this.cpf = cpf;
        } else {
            System.out.printf("O CPF %s é inválido. Verifique a informação \n", cpf);
            this.cpf = "";
        }

        setEmail(email);

        this.matricula = gerarMatricula();

    }

    public String getNome(){
        return nome;
    }

    public String getEmail() {
        return email;
    }

    public int getMatricula(){
        return matricula;
    }

    public void setEmail(String email) {
        if (email.length() > 8) {
            this.email = email;
        } else {
            System.out.printf("O e-mail %s é inválido\n", email);
            this.email = "";
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
}