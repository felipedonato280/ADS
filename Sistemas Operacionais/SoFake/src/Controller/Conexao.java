package Controller;

import Model.*;

import java.util.ArrayList;
import java.util.function.Supplier;
import javax.swing.*;

public class Conexao {
    public static ArrayList<Pastas> espaco = new ArrayList<>();
    public static ArrayList<Usuarios> usuarios = new ArrayList<>();

    public static Supplier<String> provedorEntrada = null;
    public static Runnable limparTelaCallback = null;
    private static String usuarioAtual = "";   // armazena o nome do usuário logado

    public static Maquina pc = new Maquina("Ryzen 5 5600", 32000, 1000000);

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
        boolean logado = false;
        String nomeUsuario = "";

        while(!logado){
            Thread.sleep(500);
            nomeUsuario = lerLinha("\nDigite seu nome: \n");
            Thread.sleep(500);
            String senhaUsuario = lerSenha("\nDigite sua senha: \n");
            Thread.sleep(500);

            for (Usuarios u : usuarios) {
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

            case "memory":
                System.out.println("Memoria total: " + pc.getMemoriaMaquina() + " MB");
                System.out.println("Uso de Memoria: " + pc.getUsoMemoria() + " MB");
                break;

            case "cpu":
                System.out.println("Processador: " + pc.getProcessador());
                System.out.println("Uso de CPU: " + pc.getUsoCPU() + "%");
                break;

            case "ram":
                System.out.println("RAM total: " + pc.getRamMaquina() + " MB");
                System.out.println("Uso de RAM: " + pc.getUsoRam() + " MB");
                break;

            case "df -h":
                System.out.println("Processador: " + pc.getProcessador());
                System.out.println("RAM total: " + pc.getRamMaquina() + " MB");
                System.out.println("Memoria total: " + pc.getMemoriaMaquina() + " MB");
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
                    System.out.println("Já existe uma pasta com esse nome!");
                } else {
                    Pastas nova = new Pastas(nomePastaMkdir, 10);

                    // verifica se há memória suficiente
                    if (pc.getUsoRam() + nova.getPeso() > pc.getRamMaquina() || pc.getUsoMemoria() + nova.getPeso() > pc.getMemoriaMaquina()) {
                        System.out.println("Não há recursos suficientes para criar a pasta!");
                    } else {
                        espaco.add(nova);
                        pc.consumirCPU(1);
                        pc.consumirRam(nova.getPeso());
                        pc.consumirMemoria(nova.getPeso());
                        System.out.println("Pasta criada: " + nomePastaMkdir);
                    }
                }
                break;


            case "write":
                String pastaEscolhida = lerLinha("Qual pasta?\n");
                for (Pastas p : espaco) {
                    if (p.getNome().equals(pastaEscolhida)) {
                        String texto = lerLinha("Digite o conteúdo: \n");
                        int pesoArquivo = texto.length();

                        if (pc.getUsoRam() + pesoArquivo > pc.getRamMaquina() || pc.getUsoMemoria() + pesoArquivo > pc.getMemoriaMaquina()) {
                            System.out.println("Não há recursos suficientes para escrever o arquivo!");
                        } else {
                            Conteudo conteudoNovo = new Conteudo("Entrada", texto);
                            p.setConteudo(conteudoNovo);
                            pc.consumirCPU(1);
                            pc.consumirRam(pesoArquivo);
                            pc.consumirMemoria(pesoArquivo);
                            System.out.println("Escrito em " + pastaEscolhida);
                        }
                        break;
                    }
                }
                break;


            case "rm -w":
                String pastaAlvo = lerLinha("Qual pasta deseja limpar?\n");
                boolean encontrada = false;

                for (Pastas p : espaco) {
                    if (p.getNome().equals(pastaAlvo)) {
                        encontrada = true;
                        if (p.estaVazia()) {
                            System.out.println("A pasta já está vazia.");
                        } else {
                            int pesoRemovido = 0;
                            for (Conteudo c : p.getConteudos()) {
                                pesoRemovido += c.getTexto().length();
                            }

                            p.limparConteudos();
                            System.out.println("Entradas removidas da pasta: " + pastaAlvo);

                            pc.consumirCPU(1);
                            pc.liberarRam(pesoRemovido);
                            pc.liberarMemoria(pesoRemovido);
                        }
                        break;
                    }
                }

                if (!encontrada) {
                    System.out.println("Pasta não encontrada.");
                }
                break;


            case "rm -r":
                String pastaRemover = lerLinha("Qual pasta deseja excluir?\n");
                boolean pastaEncontrada = false;

                for (Pastas p : espaco) {
                    if (p.getNome().equals(pastaRemover)) {
                        pastaEncontrada = true;

                        // calcula peso da pasta + conteúdos
                        int pesoRemovido = p.getPeso();
                        for (Conteudo c : p.getConteudos()) {
                            pesoRemovido += c.getTexto().length();
                        }

                        espaco.remove(p);
                        System.out.println("Pasta removida: " + pastaRemover);

                        // atualiza consumo da máquina
                        pc.consumirCPU(2); // remover pasta consome CPU
                        pc.liberarRam(pesoRemovido);
                        pc.liberarMemoria(pesoRemovido);

                        break;
                    }
                }

                if (!pastaEncontrada) {
                    System.out.println("Pasta não encontrada.");
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
