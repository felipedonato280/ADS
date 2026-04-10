//Escreva um programa que imprima os primeiros 10 números da sequência de Fibonacci1.

public class Ex4 {
    public static void main(String[] args){
        int soma = 1;

        for(int i = 1; i <= 10; i++){
            soma = i + i-1;
            System.out.println(soma);
        }
    }
}