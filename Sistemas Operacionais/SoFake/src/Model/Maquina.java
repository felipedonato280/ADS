package Model;

public class Maquina {
    private String processador;
    private int ramMaquina;
    private int memoriaMaquina;

    private int usoCPU;
    private float usoRam;
    private float usoMemoria;

    public Maquina(String processador, int ramMaquina, int memoriaMaquina){
        this.processador = processador;
        this.ramMaquina = ramMaquina;
        this.memoriaMaquina = memoriaMaquina;

        this.usoCPU = 5;       // em %
        this.usoRam = 1.100f;  // em MB
        this.usoMemoria = 2.000f;  // em MB
    }

    public void atualizarUso(Pastas pasta) {
        usoCPU += 1;
        usoRam += pasta.getPeso();
        usoMemoria += pasta.getPeso();
    }

    public void atualizarUsoArquivo(Conteudo conteudo) {
        usoCPU += 2;
        int pesoArquivo = conteudo.getTexto().length();
        usoRam += pesoArquivo;
        usoMemoria += pesoArquivo;
    }

    public void consumirCPU(int valor) {
        usoCPU = Math.min(100, usoCPU + valor);
    }

    public void consumirRam(float valor) {
        usoRam += valor;
    }

    public void consumirMemoria(float valor) {
        usoMemoria += valor;
    }

    public void liberarCPU(int valor) {
        usoCPU = Math.max(0, usoCPU - valor);
    }

    public void liberarRam(float valor) {
        usoRam = Math.max(0, usoRam - valor);
    }

    public void liberarMemoria(float valor) {
        usoMemoria = Math.max(0, usoMemoria - valor);
    }

    public String getProcessador(){
        return processador;
    }

    public int getRamMaquina(){
        return ramMaquina;
    }

    public int getMemoriaMaquina(){
        return memoriaMaquina;
    }

    public int getUsoCPU(){
        return usoCPU;
    }

    public float getUsoRam(){
        return usoRam;
    }

    public float getUsoMemoria(){
        return usoMemoria;
    }
}