//LISTA 1 OPERADORES ARITMETICOS E ESTRUTURA DE DECISÃO

import java.util.Scanner;
import java.util.ArrayList;
import java.util.Collections;

public class Ex7{
    public static void main(String[] args){
        //Faça um programa que armazena 3 números e exiba o maior deles.

        Scanner input = new Scanner(System.in);
        ArrayList <Integer> numeros = new ArrayList<Integer>();

        System.out.println("Quantos valores deseja testar? ");
        int quantidade = input.nextInt();

        for(int i = 0; i < quantidade; i++){
            System.out.println("Digite um numero: ");
            int numero = input.nextInt();

            numeros.add(numero);
        }
        System.out.println(numeros);
        System.out.println(numeros.size());
        System.out.println("O maior numero da lista é: " + Collections.max(numeros));

        /*
        System.out.println("Digite o 1 numero: ");
        int n1 = input.nextInt();

        System.out.println("Digite o 2 numero: ");
        int n2 = input.nextInt();

        System.out.println("Digite o 3 numero: ");
        int n3 = input.nextInt();

        if (n1 > n2 && n1 > n3){
            System.out.println("O n1 é maior");
        }
        else if (n2 > n1 && n2 > n3) {
            System.out.println("O n2 é maior");
        }
        else {
            System.out.println("O n3 é maior");
        }
        */
    }
}