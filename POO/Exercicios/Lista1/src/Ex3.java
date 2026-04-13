//LISTA 1 OPERADORES ARITMETICOS E ESTRUTURA DE DECISÃO

import java.util.Scanner;

public class Ex3 {
    public static void main(String[]args){
        //Faça um programa que analise três números variáveis contendo números inteiros, e em
        //seguida, calcule e exiba a média aritmética desses números.

        Scanner input = new Scanner(System.in);

        int[] numeros = new int[3];
        int soma = 0;

        for(int i = 0; i < 3; i++){
            System.out.println("Digite um numero: ");
            numeros[i] = input.nextInt();

            soma += numeros[i];
        }

        float media = soma/3f;
        System.out.println("A média é: " + media);
    }
}