package Controller;

import Model.Conteudo;
import Model.Manual;
import Model.Pastas;
import Model.Usuarios;

import java.util.ArrayList;
import java.util.function.Supplier;
import javax.swing.*;

public class Conexao {
    public static ArrayList<Pastas> espaco = new ArrayList<>();
    public static ArrayList<Usuarios> usuarios = new ArrayList<>();

    public static Supplier<String> provedorEntrada = null;
    public static Runnable limparTelaCallback = null;
    public static String usuarioAtual = "";   // armazena o nome do usuário logado

    private static void criarManual() {
        Manual manual = new Manual();
        espaco.add(manual);
    }

    public static void limparTela() {
        limparTelaCallback.run();
    }

    public static void mensagemCarregando(Boolean inicio) throws InterruptedException{
        Thread.sleep(200);
        System.out.print("Sistema ");

        if(inicio){
            Thread.sleep(500);
            System.out.print("Carregando");
        }
        else {
            Thread.sleep(500);
            System.out.print("Desligando");
        }
        Thread.sleep(500);
        System.out.print(".");
        Thread.sleep(500);
        System.out.print(".");
        Thread.sleep(500);
        System.out.print(".");
    }

    public static void iniciar() throws InterruptedException {
        mensagemCarregando(Boolean.TRUE);
        Thread.sleep(200);
        limparTela();

        criarManual();
    }

    public static void finalizar() throws InterruptedException {
        mensagemCarregando(Boolean.FALSE);
        Thread.sleep(200);
        limparTela();
    }

    private static String lerLinha(String prompt) {
        System.out.print(prompt);
        return provedorEntrada.get();
    }

    private static String lerSenha(String prompt) {
        System.out.print(prompt);
        JPasswordField campoSenha = new JPasswordField();
        int opcao = JOptionPane.showConfirmDialog(null, campoSenha, prompt, JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE);
        if (opcao == JOptionPane.OK_OPTION) {
            return new String(campoSenha.getPassword());
        } else {
            return "";
        }
    }

    private static int lerInteiro(String prompt) {
        while (true) {
            try {
                return Integer.parseInt(lerLinha(prompt));
            } catch (NumberFormatException e) {
                System.out.println("Por favor, digite apenas números.");
            }
        }
    }

    public static String logar() throws InterruptedException {
        System.out.println("Login");
        String nome = "";
        boolean logado = false;
        while(!logado){
            Thread.sleep(500);
            String nomeUsuario = lerLinha("\nDigite seu nome: \n");
            Thread.sleep(500);
            String senhaUsuario = lerSenha("\nDigite sua senha: \n");
            Thread.sleep(500);

            for (Usuarios u : usuarios) {
                if (u.getUsuario().equals(nomeUsuario) && u.getSenha().equals(senhaUsuario)) {
                    nome = nomeUsuario;
                    logado = true;
                    break;
                }
            }

            if(!logado){
                Thread.sleep(500);
                System.out.println("\nNome ou senha incorretos\n");
            }
        }
        usuarioAtual = nome;
        Thread.sleep(500);
        return nome;
    }

    private static void resetarSistema() {
        espaco.clear();
        usuarioAtual = "";

        criarManual();
    }

    public static String terminal(String acao) throws InterruptedException {
        String retorno = "\nComando executado\n";
        switch(acao){
            case "ajuda":
                for (Pastas p : espaco) {
                    if (p.getNome().equalsIgnoreCase("Manual.pdf")) {
                        p.mostrarConteudo();
                        return "\nManual exibido\n";
                    }
                }
                System.out.println("Manual nao encontrado");
                break;

            case "clear":
                limparTela();
                break;

            case "ls":
                if (espaco.isEmpty()) {
                    System.out.println("Nenhuma pasta encontrada");
                } else {
                    for (Pastas p : espaco) {
                        System.out.println(p.getNome());
                    }
                }
                break;

            case "mkdir":
                String nomePastaMkdir = lerLinha("Nome da pasta: ");
                boolean existe = false;

                for (Pastas p : espaco) {
                    if (p.getNome().equalsIgnoreCase(nomePastaMkdir)) {
                        existe = true;
                        break;
                    }
                }

                if (existe) {
                    System.out.println("Ja existe uma pasta com esse nome!");
                } else {
                    Pastas nova = new Pastas(nomePastaMkdir, 10);
                    espaco.add(nova);
                    System.out.println("Pasta criada: " + nomePastaMkdir);
                }
                break;

            case "write":
                String pastaEscolhida = lerLinha("Qual pasta?\n");
                for (Pastas p : espaco) {
                    if (p.getNome().equals(pastaEscolhida)) {
                        String texto = lerLinha("Digite o conteudo: \n");
                        p.setConteudo(new Conteudo("Entrada", texto));
                        System.out.println("Escrito em " + pastaEscolhida);
                        break;
                    }
                }
                break;

            case "lf":
                String nomePastaLf = lerLinha("Nome da pasta para visualizar?\n");
                for (Pastas p : espaco) {
                    if (p.getNome().equals(nomePastaLf)) {
                        p.mostrarConteudo();
                    }
                }
                break;

            case "rm -r":
                String pastaRemover = lerLinha("Qual pasta deseja excluir?\n");
                espaco.removeIf(p -> p.getNome().equals(pastaRemover));
                System.out.println("Pasta removida: " + pastaRemover);
                break;

            case "logoff":
                finalizar();
                resetarSistema();
                logar();
                limparTela();
                System.out.println("Bem-Vindo " + usuarioAtual + "!\n");
                System.out.println("Este e o SABOR Sistema Operacional\n");
                System.out.println("Escreva (ajuda) para ver o manual de comandos\n");
                break;

            case "poweroff":
                finalizar();
                retorno = "break";
                break;

            default:
                retorno = "Comando '" + acao + "' nao encontrado\n";
                break;
        }
        return retorno;
    }
}
