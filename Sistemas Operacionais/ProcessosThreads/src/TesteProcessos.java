import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class TesteProcessos {
    public static void main(String[] args) throws Exception {
        Scanner input = new Scanner(System.in);

        System.out.println("Escolha a operação:");
        System.out.println("1 - Raiz quadrada");
        System.out.println("2 - Soma");

        int operacao = input.nextInt();

        System.out.println("Quantos processos deseja criar?");
        int quantidade = input.nextInt();

        long inicio = System.nanoTime();

        List<Process> processos = new ArrayList<>();

        for (int i = 0; i < quantidade; i++) {

            ProcessBuilder pb = new ProcessBuilder("java", "-cp", System.getProperty("java.class.path"), "ProcessoExecutando", String.valueOf(operacao));

            pb.inheritIO();

            Process p = pb.start();

            processos.add(p);
        }

        for (Process p : processos) {
            p.waitFor();
        }

        long fim = System.nanoTime();
        double tempoSegundos = (fim - inicio) / 1_000_000_000.0;

        System.out.println("\nTodos os " + quantidade + " processos foram finalizados");
        System.out.println("Tempo: " + tempoSegundos + " segundos");

        input.close();
    }
}