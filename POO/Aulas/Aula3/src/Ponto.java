import java.util.Scanner;

public class Ponto {
    float x;
    float y;

    public void lerPonto(){
        Scanner input = new Scanner(System.in);

        System.out.printf("Qual o valor de X: ");
        x = input.nextFloat();

        System.out.printf("Qual o valor de Y: ");
        y = input.nextFloat();
    }

    public String retornaPosicaoPonto(){
        if (x > 0 && y > 0)
            return "Quadrante 1";
        else if (x < 0 && y > 0)
            return "Quadrante 2";
        else if (x < 0 && y < 0)
            return "Quadrante 3";
        else if (x > 0 && y < 0)
            return "Quadrante 4";
        else if (x == 0 && y == 0)
            return "Origem";
        else if (x == 0)
            return "Eixo Y";
        else
            return "Eixo X";
    }

    public static void main(String[] args){
        Ponto p1 = new Ponto();
        p1.lerPonto();

        System.out.println(p1.retornaPosicaoPonto());
    }
}