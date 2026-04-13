//Faça um programa que lê o valor de uma variável de 0 a 10 e exiba a seguinte mensagem,
//dependendo do valor da nota:
//◦ Se a nota for menor que 1.7, exiba "Reprovado".
//◦ Se a nota for maior ou igual a 1.7 e menor que 7, exiba "Em exame".
//◦ Se a nota for maior ou igual a 7, exiba "Aprovado".

import java.util.Scanner;

public class Ex8 {
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);

        float nota = 0;

        do{
            System.out.println("Digite a sua nota: ");
            nota = input.nextFloat();

            if(nota < 0 || nota > 10){
                System.out.println("Nota invalida, tente novamente");
            }
        }while(nota < 0 || nota > 10);

        if(nota < 1.7){
            System.out.println("Reprovado");
        }
        else if(nota < 7){
            System.out.println("Em exame");
        }
        else{
            System.out.println("Aprovado");
        }
    }
}