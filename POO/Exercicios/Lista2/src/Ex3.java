//Faça um algoritmo que faça um laço de repetição de 1 a 500 e analisa se os números são
//diviseis por 3 e 5. Caso o número seja divisível por 3 deve escrever “Fizz”. Caso o número
//seja divisível por 5 deve escrever “Buzz”. Se o número for divisível por 3 e por 5, deve
//escrever “FizzBuzz”, caso contrário, deve escrever o número na tela.
//Exemplo de saída: 1, 2, Fizz, 4, Buzz, Fizz, ......FizzBuzz (no lugar do 15)

public class Ex3 {
    public static void main(String[]args){
        for(int i = 1; i <= 500; i++){
            if(i % 3 == 0 && i % 5 == 0){
                System.out.printf("FizzBuzz");
            }
            else if (i % 3 == 0) {
                System.out.printf("Fizz");
            }
            else if(i % 5 == 0){
                System.out.printf("Buzz");
            }
            else{
                System.out.printf("%d", i);
            }

            System.out.printf(i != 500 ? ", " : ".");
        }
    }
}