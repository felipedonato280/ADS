import java.util.Scanner;

public class Ex1 {
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);

        System.out.println("Digite o seu nome completo: ");
        String nome = input.nextLine().toLowerCase();

        // Removendo espaços em branco adicionais usando regex parecido com Python
        // O \s significa caracter de espaçamento
        // O + significa em mais de uma ocorrencia
        // O \\ é pq uma \ em java é a fuga da string entao precisa de 2 \

        nome = nome.replaceAll("\\s+", " ");

        String email;

        if(nome.contains(" ")){
            String primeiroNome = nome.substring(0, nome.indexOf(" "));
            String nomeDoMeio = nome.substring(nome.indexOf(" ")).replaceAll(" ", "");

            email = primeiroNome + "." + nomeDoMeio + "@gmail.com";
        }
        else{
            email = nome + "@gmail.com";
        }

        String email2 = nome.replaceAll(" ", ".") + "@gmail.com";

        System.out.println(email);
        System.out.println(email2);
    }
}