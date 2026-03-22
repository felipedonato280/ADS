import java.util.Scanner;

public class Ex3 {
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);

        System.out.println("Digite uma frase: ");
        String frase = input.nextLine().toLowerCase();

        int contagem = 0;

        for(int i = 0; i < frase.length(); i++){
            char letra = frase.charAt(i);

            if(letra == 'a' || letra == 'e' || letra == 'i' || letra == 'o' || letra == 'u'){
                contagem++;
            }
        }

        /*
        for(int i = 0; i < frase.length(); i++){
            char letra = frase.charAt(i);

            if("aeiou".indexOf(letra) >= 0){
                contagem++;
            }
        }
         */

        System.out.println("A frase tem "+ contagem+ " vogais");
    }
}