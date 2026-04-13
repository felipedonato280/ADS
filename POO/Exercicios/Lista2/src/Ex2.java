public class Ex2{
    public static void main(String[] args){
        int soma = 0;

        for(int i = 1; i < 50; i = i + 2){
            soma += i;
        }

        System.out.print(soma);
    }
}