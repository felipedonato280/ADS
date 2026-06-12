package Model;

public class Manual extends Pastas{
    public Manual(){
        super("Manual.pdf", 10);

        Conteudo conteudoManual = new Conteudo("Manual.pdf", """
                Commands:
                - clear = Limpa tudo
                - ls = Mostra tudo
                - memory = Mostra a memória
                - cpu = Mostra a CPU
                - ram = Mostra a RAM
                - df -h = Mostra o sistema
                - mkdir = Cria pastas
                - write = Escreve nas pastas
                - rm -w = Exclui entradas nas pastas
                - rm -r = Exclui pastas
                - lf = Mostra o conteudo das pastas
                - logOff = Faz logout
                - poweroff = Desliga o sistema
                """);

        setConteudo(conteudoManual);
    }
}