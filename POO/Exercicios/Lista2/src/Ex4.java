//Escreva um programa que imprima os primeiros 10 números da sequência de Fibonacci1.

public class Ex4 {
    public static void main(String[] args){
        int n = 10; // quantidade de termos

        int a = 0;
        int b = 1;

        System.out.println("Sequência de Fibonacci:");

        for (int i = 0; i < n; i++) {
            System.out.println(a);

            int proximo = a + b;
            a = b;
            b = proximo;
        }
    }
}