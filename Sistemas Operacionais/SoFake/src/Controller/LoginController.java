package Controller;

import Model.Usuario;
import View.TelaTerminal;

import java.util.ArrayList;

public class LoginController {

    public static ArrayList<Usuario> usuarios = new ArrayList<>();
    public static String usuarioAtual = "";   // armazena o nome do usuário logado

    public static String logar() throws InterruptedException {
        System.out.println("Login");
        boolean logado = false;
        String nomeUsuario = "";

        while(!logado){
            Thread.sleep(500);
            nomeUsuario = TelaTerminal.lerLinha("\nDigite seu nome: \n");
            Thread.sleep(500);
            String senhaUsuario = TelaTerminal.lerSenha("\nDigite sua senha: \n");
            Thread.sleep(500);

            for (Usuario u : usuarios) {
                if (u.getUsuario().equals(nomeUsuario) && u.autentica(senhaUsuario)) {
                    logado = true;
                    break;
                }
            }

            if(!logado){
                Thread.sleep(500);
                System.out.println("\nNome ou senha incorretos\n");
            }
        }
        usuarioAtual = nomeUsuario;
        Thread.sleep(500);
        return nomeUsuario;
    }
}