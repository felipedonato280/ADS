import java.util.Scanner;

public class Ex4TerceiroModo {
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);

        System.out.println("Digite a palavra: ");
        String palavra = input.nextLine();
        StringBuilder palavraContrario = new StringBuilder();

        for(int i = palavra.length() - 1; i >= 0; i--){
            palavraContrario.append(palavra.charAt(i));
        }

        String palavraInvertida = palavraContrario.toString();

        System.out.println(palavraInvertida);

        if(palavra.equalsIgnoreCase(palavraInvertida)){
            System.out.println("É um palindromo");
        }
        else{
            System.out.println("Não é um palindromo");
        }
    }
}