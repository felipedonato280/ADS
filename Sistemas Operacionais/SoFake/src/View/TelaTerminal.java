package View;

import Controller.ComandoController;
import Controller.LoginController;
import Controller.SistemaOperacionalController;

import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.text.BadLocationException;
import javax.swing.text.Document;
import java.awt.*;
import java.io.OutputStream;
import java.io.PrintStream;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.function.Supplier;

public class TelaTerminal {
    private JTextArea saidaTerminal;
    private JTextField textoEntrada;
    private JFrame TelaFundo;
    private BlockingQueue<String> inputQueue = new ArrayBlockingQueue<>(1);
    private boolean systemOn = true;
    private static final int MAX_LINES = 500;
    public static Runnable limparTelaCallback = null;
    public static Supplier<String> provedorEntrada = null;

    public TelaTerminal() {
        // Provedor de entrada: pega o texto do campo de texto da GUI
        provedorEntrada = () -> {
            try {
                return inputQueue.take(); // Aguarda até que um comando seja digitado
            } catch (InterruptedException e) {
                return "";
            }
        };

        // Definição das cores e borda baseadas na imagem
        Color fundoTerminal = new Color(0, 0, 0);
        Color corTexto = new Color(255, 255, 255);
        Color corTextoInput = new Color(0, 0, 0);
        Color corBotao = new Color(150, 190, 230);
        Border borda = BorderFactory.createLineBorder(new Color(180, 180, 180), 2);

        // Tela / Fundo
        TelaFundo = new JFrame(); // Cria a janela
        TelaFundo.setSize(1280, 720); // Tamanho da tela
        TelaFundo.setTitle("Sistema Operacional Fake"); // Nome da tela
        TelaFundo.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // Garante que ela pare o programa ao fechar a janela
        TelaFundo.setResizable(false); // Garante que a tela não possa ser mudada de tamanho
        TelaFundo.setLocationRelativeTo(null); // Faz a janela aparecer no meio da tela

        // Criando a área de saída grande do terminal
        saidaTerminal = new JTextArea();
        saidaTerminal.setFont(new Font("Monospaced", Font.PLAIN, 18));
        saidaTerminal.setBackground(fundoTerminal);
        saidaTerminal.setForeground(corTexto);
        saidaTerminal.setEditable(false);
        saidaTerminal.setLineWrap(true);
        saidaTerminal.setWrapStyleWord(true);
        saidaTerminal.setBorder(BorderFactory.createCompoundBorder(
                borda, // mantém a borda existente
                BorderFactory.createEmptyBorder(10, 10, 10, 10) // padding interno
        ));

        // Text
        textoEntrada = new JTextField(); // Cria o campo de texto
        textoEntrada.setFont(new Font("Monospaced", Font.PLAIN, 16)); // Mude a fonte para parecer um terminal
        textoEntrada.setBounds(50, 560, 960, 50); // Posição
        textoEntrada.setBackground(Color.WHITE); // Define a cor de fundo branca para o campo de entrada
        textoEntrada.setForeground(corTextoInput); // Define a cor do texto para o campo de entrada
        textoEntrada.setBorder(borda); // Aplica a borda cinza no campo de entrada
        TelaFundo.add(textoEntrada); // Adiciona na janela

        // Button
        TelaFundo.setLayout(null); // Permite setar o botão
        JButton button = new JButton("Send"); // Cria o botão
        button.setBounds(1030, 560, 200, 50); // Posição do botão
        button.setFont(new Font("Arial", Font.BOLD, 18)); // Define a fonte
        button.setForeground(corTexto); // Cor da escrita
        button.setBackground(corBotao); // Cor do botão
        button.setBorder(borda); // Aplica a borda cinza no botão
        TelaFundo.add(button); // Adiciona na janela

        // Adiciona uma barra de rolagem à área de saída (evita travamento quando o conteúdo cresce)
        JScrollPane scrollPane = new JScrollPane(saidaTerminal);
        scrollPane.setBounds(50, 40, 1180, 500); // Posição e tamanho da área com rolagem
        scrollPane.setBorder(borda); // Aplica a mesma borda
        TelaFundo.add(scrollPane); // Adiciona o painel com rolagem no lugar da área pura

        // Interceptador
        PrintStream interceptor = new PrintStream(new OutputStream() {
            @Override
            public void write(int b) {
                SwingUtilities.invokeLater(() -> {
                    saidaTerminal.append(String.valueOf((char) b)); // Adiciona o caractere na área de saída
                    limiteLinhas(); // Remove linhas antigas se ultrapassar o limite (evita travamento)
                });
            }
        });
        System.setOut(interceptor); // Aplica o redirecionamento global no Java

        // Callback para o comando "clear" funcionar na GUI (limpa o JTextArea)
        limparTelaCallback = () -> {
            SwingUtilities.invokeLater(() -> saidaTerminal.setText(""));
        };

        TelaFundo.setVisible(true); // Deixa tudo visível

        // Thread principal do sistema (roda em segundo plano para não travar a interface)
        new Thread(() -> {
            try {
                SistemaOperacionalController.iniciar();
                String user = LoginController.logar();
                limparTela();
                System.out.println("Bem-Vindo " + user + "!\n");
                System.out.println("Este e o SABOR Sistema Operacional\n");
                System.out.println("Escreva (ajuda) para ver o manual de comandos\n");

                while (systemOn) {
                    String action = inputQueue.take();
                    String result = ComandoController.terminal(action.toLowerCase());

                    if (SistemaOperacionalController.pc.getUsoCPU() >= 100) {
                        SwingUtilities.invokeLater(() -> {
                            new TelaAzul();
                            TelaFundo.dispose();
                        });
                        systemOn = false;
                        break;
                    }

                    if (result.equals("break")) {
                        systemOn = false;
                        System.out.println("System Off");
                        SwingUtilities.invokeLater(() -> TelaFundo.dispose());
                        break;
                    } else {
                        System.out.println(result);
                    }
                }
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }).start();

        // Esse metodo é acionado quando você clica no botão Enviar ou aperta Enter
        button.addActionListener(e -> enviarComando());
        textoEntrada.addActionListener(e -> enviarComando());
    }

    public static void limparTela() {
        limparTelaCallback.run();
    }

    public static String lerLinha(String prompt) {
        System.out.print(prompt);
        return provedorEntrada.get();
    }

    public static String lerSenha(String prompt) {
        System.out.print(prompt);
        JPasswordField campoSenha = new JPasswordField();
        int opcao = JOptionPane.showConfirmDialog(null, campoSenha, prompt, JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE);
        if (opcao == JOptionPane.OK_OPTION) {
            return new String(campoSenha.getPassword());
        } else {
            return "";
        }
    }

    private void enviarComando() {
        String cmd = textoEntrada.getText().trim(); // Pega a escrita
        if (!cmd.isEmpty()) { // Garante que terá um texto a ser enviado
            textoEntrada.setText(""); // Limpa o campo de escrita
            inputQueue.offer(cmd); // Coloca o comando na fila para o sistema processar
            textoEntrada.requestFocus(); // Devolve o foco e o cursor piscando para o campo de digitação
        }
    }

    private void limiteLinhas() {
        Document doc = saidaTerminal.getDocument();
        try {
            String text = doc.getText(0, doc.getLength()); // Pega todo o texto atual
            String[] lines = text.split("\n");
            if (lines.length > MAX_LINES) {
                int excess = lines.length - MAX_LINES;
                int removeUpTo = 0;
                for (int i = 0; i < excess; i++) {
                    removeUpTo += lines[i].length() + 1;
                }
                doc.remove(0, removeUpTo);
            }
        } catch (BadLocationException e) {
            e.printStackTrace();
        }
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
}