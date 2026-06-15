package Controller;

import Model.Conteudo;
import Model.Pasta;
import View.TelaTerminal;

import java.util.ArrayList;

public class ComandoController {
    public static ArrayList<Pasta> espaco = new ArrayList<>();

    public static String terminal(String acao) throws InterruptedException {
        String retorno = "\nComando executado\n";
        switch(acao){
            case "ajuda":
                for (Pasta p : espaco) {
                    if (p.getNome().equalsIgnoreCase("Manual.pdf")) {
                        p.mostrarConteudo();
                        return "\nManual exibido\n";
                    }
                }
                System.out.println("Manual nao encontrado");
                break;

            case "clear":
                TelaTerminal.limparTela();
                break;

            case "ls":
                if (espaco.isEmpty()) {
                    System.out.println("Nenhuma pasta encontrada");
                } else {
                    for (Pasta p : espaco) {
                        System.out.println(p.getNome());
                    }
                }
                break;

            case "memory":
                System.out.println("Memoria total: " + SistemaOperacionalController.pc.getMemoriaMaquina() + " MB");
                System.out.println("Uso de Memoria: " + SistemaOperacionalController.pc.getUsoMemoria() + " MB");
                break;

            case "cpu":
                System.out.println("Processador: " + SistemaOperacionalController.pc.getProcessador());
                System.out.println("Uso de CPU: " + SistemaOperacionalController.pc.getUsoCPU() + "%");
                break;

            case "ram":
                System.out.println("RAM total: " + SistemaOperacionalController.pc.getRamMaquina() + " MB");
                System.out.println("Uso de RAM: " + SistemaOperacionalController.pc.getUsoRam() + " MB");
                break;

            case "df -h":
                System.out.println("Processador: " + SistemaOperacionalController.pc.getProcessador());
                System.out.println("RAM total: " + SistemaOperacionalController.pc.getRamMaquina() + " MB");
                System.out.println("Memoria total: " + SistemaOperacionalController.pc.getMemoriaMaquina() + " MB");
                break;

            case "mkdir":
                String nomePastaMkdir = TelaTerminal.lerLinha("Nome da pasta: ");
                boolean existe = false;

                for (Pasta p : espaco) {
                    if (p.getNome().equalsIgnoreCase(nomePastaMkdir)) {
                        existe = true;
                        break;
                    }
                }

                if (existe) {
                    System.out.println("Já existe uma pasta com esse nome!");
                } else {
                    Pasta nova = new Pasta(nomePastaMkdir, 10);

                    // verifica se há memória suficiente
                    if (SistemaOperacionalController.pc.getUsoRam() + nova.getPeso() > SistemaOperacionalController.pc.getRamMaquina() || SistemaOperacionalController.pc.getUsoMemoria() + nova.getPeso() > SistemaOperacionalController.pc.getMemoriaMaquina()) {
                        System.out.println("Não há recursos suficientes para criar a pasta!");
                    } else {
                        espaco.add(nova);
                        SistemaOperacionalController.pc.consumirCPU(1);
                        SistemaOperacionalController.pc.consumirRam(nova.getPeso());
                        SistemaOperacionalController.pc.consumirMemoria(nova.getPeso());
                        System.out.println("Pasta criada: " + nomePastaMkdir);
                    }
                }
                break;


            case "write":
                String pastaEscolhida = TelaTerminal.lerLinha("Qual pasta?\n");
                for (Pasta p : espaco) {
                    if (p.getNome().equals(pastaEscolhida)) {
                        String texto = TelaTerminal.lerLinha("Digite o conteúdo: \n");
                        int pesoArquivo = texto.length();

                        if (SistemaOperacionalController.pc.getUsoRam() + pesoArquivo > SistemaOperacionalController.pc.getRamMaquina() || SistemaOperacionalController.pc.getUsoMemoria() + pesoArquivo > SistemaOperacionalController.pc.getMemoriaMaquina()) {
                            System.out.println("Não há recursos suficientes para escrever o arquivo!");
                        } else {
                            Conteudo conteudoNovo = new Conteudo("Entrada", texto);
                            p.setConteudo(conteudoNovo);
                            SistemaOperacionalController.pc.consumirCPU(1);
                            SistemaOperacionalController.pc.consumirRam(pesoArquivo);
                            SistemaOperacionalController.pc.consumirMemoria(pesoArquivo);
                            System.out.println("Escrito em " + pastaEscolhida);
                        }
                        break;
                    }
                }
                break;


            case "rm -w":
                String pastaAlvo = TelaTerminal.lerLinha("Qual pasta deseja limpar?\n");
                boolean encontrada = false;

                for (Pasta p : espaco) {
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

                            SistemaOperacionalController.pc.consumirCPU(1);
                            SistemaOperacionalController.pc.liberarRam(pesoRemovido);
                            SistemaOperacionalController.pc.liberarMemoria(pesoRemovido);
                        }
                        break;
                    }
                }

                if (!encontrada) {
                    System.out.println("Pasta não encontrada.");
                }
                break;


            case "rm -r":
                String pastaRemover = TelaTerminal.lerLinha("Qual pasta deseja excluir?\n");
                boolean pastaEncontrada = false;

                for (Pasta p : espaco) {
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
                        SistemaOperacionalController.pc.consumirCPU(2); // remover pasta consome CPU
                        SistemaOperacionalController.pc.liberarRam(pesoRemovido);
                        SistemaOperacionalController.pc.liberarMemoria(pesoRemovido);

                        break;
                    }
                }

                if (!pastaEncontrada) {
                    System.out.println("Pasta não encontrada.");
                }
                break;


            case "lf":
                String nomePastaLf = TelaTerminal.lerLinha("Nome da pasta para visualizar?\n");
                for (Pasta p : espaco) {
                    if (p.getNome().equals(nomePastaLf)) {
                        p.mostrarConteudo();
                    }
                }
                break;

            case "logoff":
                SistemaOperacionalController.finalizar();
                SistemaOperacionalController.resetarSistema();
                LoginController.logar();
                TelaTerminal.limparTela();
                System.out.println("Bem-Vindo " + LoginController.usuarioAtual + "!\n");
                System.out.println("Este e o SABOR Sistema Operacional\n");
                System.out.println("Escreva (ajuda) para ver o manual de comandos\n");
                break;

            case "poweroff":
                SistemaOperacionalController.finalizar();
                retorno = "break";
                break;

            default:
                retorno = "Comando '" + acao + "' nao encontrado\n";
                break;
        }
        return retorno;
    }
}