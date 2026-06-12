import Controller.Conexao;
import Model.*;
import View.TelaTerminal;

public class SO {
    public static void main(String[] args) throws InterruptedException {
        Usuarios user1 = new Usuarios("Eduardo", "1234");
        Usuarios user2 = new Usuarios("Felipe", "5678");
        Usuarios user3 = new Usuarios("Kátia", "9012");
        Usuarios user4 = new Usuarios("Lui", "3456");
        Usuarios user5 = new Usuarios("Stefania", "7890");

        Conexao.usuarios.add(user1);
        Conexao.usuarios.add(user2);
        Conexao.usuarios.add(user3);
        Conexao.usuarios.add(user4);
        Conexao.usuarios.add(user5);

        new TelaTerminal(); // apenas abre a interface
    }
}