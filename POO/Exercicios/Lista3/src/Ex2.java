import java.util.Random;

public class Ex2 {
    public static void main(String[] args){
        Random aleatorio = new Random();
        int quantiCaracteres = aleatorio.nextInt(1,11);

        String senha = "";

        for(int i = 0; i < quantiCaracteres; i++ ){

            int tipo = aleatorio.nextInt(3);
            char caracter;

            switch (tipo){
                case 0:
                    caracter = (char) aleatorio.nextInt(65, 91);
                    break;
                case 1:
                    caracter = (char) aleatorio.nextInt(97, 123);
                    break;
                case 2:
                    caracter = 32;
                    break;
                default:
                    caracter = 0;
            }

            senha += caracter;
        }

        System.out.println(senha);
        System.out.println(senha.length());
    }
}