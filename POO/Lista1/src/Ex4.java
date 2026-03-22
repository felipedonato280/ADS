//LISTA 1 OPERADORES ARITMETICOS E ESTRUTURA DE DECISÃO

import java.util.Scanner;

public class Ex4 {
    public static void main(String[]args){
        //Crie um programa que verifica se um número inteiro é positivo, negativo ou zero.
        Scanner input = new Scanner(System.in);

        System.out.println("Digite o valor: ");
        int valor = input.nextInt();

        if(valor < 0)
            System.out.print("Numero negativo");
        else if(valor > 0)
            System.out.print("Numero positivo");
        else
            System.out.print("Valor igual a 0");
    }
}
