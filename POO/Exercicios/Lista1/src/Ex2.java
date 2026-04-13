//LISTA 1 OPERADORES ARITMETICOS E ESTRUTURA DE DECISÃO

import java.util.Scanner;

public class Ex2 {
    public static void main(String[]args){
        //Faça um programa que calcula e mostre o percentual de frequência de um estudante. Para
        //isso, considere que 120 períodos correspondem a 100% da carga horária.

        Scanner input = new Scanner(System.in);

        System.out.println("Qual foi a sua quantidade de frequncia?");
        int presenca = input.nextInt();

        float frequencia = ((float)presenca / 120) * 100;

        System.out.printf("Sua presenca foi de %.2f%%", frequencia);
    }
}
