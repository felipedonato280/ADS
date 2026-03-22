import java.util.Random;

public class Ex2TerceiroModelo {
    public static void main(String[] args){
        Random aleatorio = new Random();

        int quantiCaracteres = aleatorio.nextInt(1, 11);
        StringBuilder senha = new StringBuilder(quantiCaracteres);

        for(int i = 0; i < quantiCaracteres; i++){
            int tipo = aleatorio.nextInt(3);

            char caracter;
            if (tipo == 0) {
                caracter = (char) ('A' + aleatorio.nextInt(26));
            } else if (tipo == 1) {
                caracter = (char) ('a' + aleatorio.nextInt(26));
            } else {
                caracter = ' ';
            }
            senha.append(caracter);
        }

        System.out.println(senha.toString());
    }
}