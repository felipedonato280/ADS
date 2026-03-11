import java.util.Scanner;

public class Ex1 {
    public static void main(String[] args){
        // Faça um programa que incrementa o valor de uma variável em 10% e escreva os dois
        // valores na tela.

        Scanner input = new Scanner(System.in);

        System.out.println("Digite um valor: ");
        int n1 = input.nextInt();

        float novoValor = n1 * 1.1f;

        System.out.println("Novo valor: "+ novoValor);
        System.out.println("Valor antigo: "+ n1);
    }
}
