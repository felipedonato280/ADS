public class Aula2 {
    public static void main(String[] args){
        int a = 6;
        int b = 4;

        //float result = (float)a / b; //USANDO CAST COMO CONVERSAO

        //Por padrao o "/" é divisao inteira se for 2 numeros tipo int
        //mas se tiver um tipo float o resultado sera float

        int result = a / b;
        System.out.println("O resultado é: "+result);

        // i = i + 2 pula de 2 em 2
        for(int i = 0; i <= 10; i++){
            System.out.println(i);
        }

        boolean status = false;

        int i = 0;

        while(status == false){
            System.out.println(i);
            i++;
            if (i == 10)
                status = true;
        }

        boolean encontrado = false;

        i = 0;

        do{
            System.out.println(i);
            i++;
            if(i == 200)
                encontrado = true;
        }while(! encontrado);
    }
}
