import java.util.Scanner;

public class Ex4 {
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);

        System.out.println("Digite a palavra: ");
        String palavra = input.nextLine();
        String palavraContrario = "";

        for(int i = 0; i < palavra.length(); i++){
            palavraContrario += palavra.charAt(palavra.length() - 1 - i);
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