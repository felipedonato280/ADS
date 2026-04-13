//LISTA 1 OPERADORES ARITMETICOS E ESTRUTURA DE DECISÃO

import java.util.Scanner;

public class Ex5 {
    public static void main(String[]args){
        // Escreva um programa que verifica se um número é par ou ímpar.
        Scanner input = new Scanner(System.in);

        System.out.println("Digite um valor para ver se é par ou impar: ");
        int valor = input.nextInt();

        if (valor % 2 == 0)
            System.out.print("O numero é par");
        else
            System.out.print("O numero é impar");
    }
}
