import java.util.Scanner;

public class Ex1TerceiroModo {
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);

        System.out.println("Digite o seu nome completo: ");
        String nome = input.nextLine().toLowerCase();
        String[] partes = nome.split("\\s+");

        String primeiroNome = partes[0];

        StringBuilder sobrenome = new StringBuilder();
        StringBuilder sobrenome2 = new StringBuilder();

        for(int i = 1; i < partes.length; i++){
            sobrenome.append(partes[i]);
            sobrenome2.append(".").append(partes[i]);
        }

        String email;

        if(partes.length > 1){
            email = primeiroNome + "." + sobrenome + "@gmail.com";
        }
        else{
            email = primeiroNome + "@gmail.com";
        }

        String email2 = primeiroNome + sobrenome2 + "@gmail.com";

        System.out.println(email);
        System.out.println(email2);
    }
}