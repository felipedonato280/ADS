package Controller;

import Model.*;
import View.TelaTerminal;

public class SistemaOperacionalController {

    public static Maquina pc = new Maquina("Ryzen 5 5600", 32000, 1000000);

    private static void criarManual() {
        Manual manual = new Manual();
        ComandoController.espaco.add(manual);
    }

    public static void iniciar() throws InterruptedException {
        TelaTerminal.mensagemCarregando(Boolean.TRUE);
        Thread.sleep(200);
        TelaTerminal.limparTela();

        criarManual();
    }

    public static void finalizar() throws InterruptedException {
        TelaTerminal.mensagemCarregando(Boolean.FALSE);
        Thread.sleep(200);
        TelaTerminal.limparTela();
    }

    public static void resetarSistema() {
        ComandoController.espaco.clear();
        LoginController.usuarioAtual = "";

        criarManual();
    }
}