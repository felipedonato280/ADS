//LISTA 1 OPERADORES ARITMETICOS E ESTRUTURA DE DECISÃO

import java.util.Scanner;

public class Ex6 {
    public static void main(String[]args){
        //Faça um programa que escreve uma data por extenso, lendo os dados de três variáveis
        //(representando uma data). Exemplo: 15/03/2023 → 15 de março de 2023.

        Scanner input = new Scanner(System.in);

        System.out.println("Digite o dia: ");
        int dia = input.nextInt();

        if (dia < 1 || dia > 31)
            System.out.println("Dia invalido");

        System.out.println("Digite o mes: ");
        int mes = input.nextInt();

        String MesE = "";

        switch(mes){
            case 1: MesE = "janeiro"; break;
            case 2: MesE = "fevereiro"; break;
            case 3: MesE = "março"; break;
            case 4: MesE = "abril"; break;
            case 5: MesE = "maio"; break;
            case 6: MesE = "junho"; break;
            case 7: MesE = "julho"; break;
            case 8: MesE = "agosto"; break;
            case 9: MesE = "setembro"; break;
            case 10: MesE = "outubro"; break;
            case 11: MesE = "novembro"; break;
            case 12: MesE = "dezembro"; break;
            default:
                System.out.println("Mês inválido");
                return;
        }

        System.out.println("Digite o ano: ");
        int ano = input.nextInt();

        System.out.printf("%d de %s de %d \n",dia, MesE, ano);
        System.out.println(dia + " de " + MesE + " de " + ano + ".");
        System.out.println(dia + "/" + mes + "/" + ano);
    }
}