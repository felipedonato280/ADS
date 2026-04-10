import java.util.Scanner;
//LISTA 2 LAÇOS DE REPETIÇÃO

public class Ex1 {
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);

        System.out.println("Digite o valor que deseja fazer a tabuada: ");
        int valor = input.nextInt();

        for(int i = 1; i <= 10; i++){
            System.out.printf("%d x %d = %d\n", i, valor, i * valor);
        }
    }
}