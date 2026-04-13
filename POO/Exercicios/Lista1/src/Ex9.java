//Faça um programa que leia o salário de um funcionário de uma variável e calcula o valor do
//seu aumento, de acordo com as seguintes condições:
//◦ Salários até R$ 1.280,00: aumento de 20%
//◦ Salários entre R$ 1.280,00 e R$ 1.800,00: aumento de 15%
//◦ Salários entre R$ 1.800,00 e R$ 2.500,00: aumento de 10%
//◦ Salários acima de R$ 2.500,00: aumento de 5%

import java.util.Scanner;

public class Ex9 {
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);

        float salario;

        do{
            System.out.println("Qual o seu salario? ");
            salario = input.nextFloat();

            if(salario < 0)
                System.out.println("Salario invalido, tente novamente");

        }while(salario < 0);

        float percentual;

        if(salario < 1280){
            percentual = 0.2f;
        }
        else if(salario <= 1800 ){
            percentual = 0.15f;
        }
        else if(salario <= 2500 ){
            percentual = 0.10f;
        }
        else{
            percentual = 0.05f;
        }

        float aumento = salario * percentual;
        float salarioAtual = salario + aumento;

        System.out.printf("Salario original: R$ %.2f\n", salario);
        System.out.printf("Valor do aumento: R$ %.2f\n", aumento);
        System.out.printf("Novo salario: R$ %.2f\n", salarioAtual);
    }
}