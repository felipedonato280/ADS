import java.util.Scanner;

public class Ex4SegundoModo {
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);

        System.out.println("Digite a palavra: ");
        String palavra = input.nextLine();
        String palavraContrario = "";

        for(int i = palavra.length() - 1; i >= 0; i--){
            palavraContrario += palavra.charAt(i);
        }

        System.out.println(palavraContrario);

        if(palavra.equalsIgnoreCase(palavraContrario)){
            System.out.println("É um palindromo");
        }
        else{
            System.out.println("Não é um palindromo");
        }
    }
}