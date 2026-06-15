import Controller.LoginController;
import Controller.SistemaOperacionalController;
import Model.*;
import View.TelaTerminal;

public class SO {
    public static void main(String[] args) throws InterruptedException {
        Usuario user1 = new Usuario("Eduardo", "1234");
        Usuario user2 = new Usuario("Felipe", "5678");
        Usuario user3 = new Usuario("Kátia", "9012");
        Usuario user4 = new Usuario("Lui", "3456");
        Usuario user5 = new Usuario("Stefania", "7890");

        LoginController.usuarios.add(user1);
        LoginController.usuarios.add(user2);
        LoginController.usuarios.add(user3);
        LoginController.usuarios.add(user4);
        LoginController.usuarios.add(user5);

        new TelaTerminal(); // apenas abre a interface
    }
}