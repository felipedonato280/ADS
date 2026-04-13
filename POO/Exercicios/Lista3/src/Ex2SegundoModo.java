import java.util.Random;

public class Ex2SegundoModo {
    public static void main(String[] args){
        Random aleatorio = new Random();

        int quantiCaracteres = aleatorio.nextInt(1, 11);
        String caracteres = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%&* ";
        String senha = "";

        for(int i = 0; i < quantiCaracteres; i++){
            senha += caracteres.charAt(aleatorio.nextInt(caracteres.length()));
        }

        System.out.printf("A sua senha é '%s' e tem %d caracteres", senha, senha.length());
    }
}