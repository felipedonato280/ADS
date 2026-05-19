import java.util.Scanner;

public class TesteThreads{
    static class MinhaThread extends Thread {

        private int operacao;

        public MinhaThread(int operacao) {
            this.operacao = operacao;
        }

        public double raiz(long numero) {
            double x = 0;

            for (long i = 0; i < numero; i++) {
                x += Math.sqrt(i);
            }

            return x;
        }

        public void mostrarSoma(long numero) {
            long soma = 0;

            for (int i = 1; i <= numero; i++) {
                soma += i;
                System.out.println(Thread.currentThread().getName() + " -> " + soma);
            }
        }

        @Override
        public void run() {
            switch (operacao) {
                case 1:
                    double resultado = raiz(1000000000L);
                    System.out.println("Resultado raiz: " + resultado);
                    break;

                case 2:
                    mostrarSoma(100000);
                    break;

                default:
                    System.out.println("Operação inválida");
            }

            System.out.println("Thread finalizada: " + Thread.currentThread().getName()
            );
        }
    }

    public static void main(String[] args) throws InterruptedException {

        Scanner input = new Scanner(System.in);

        System.out.println("Escolha a operação:");
        System.out.println("1 - Raiz quadrada");
        System.out.println("2 - Soma");

        int operacao = input.nextInt();

        System.out.println("Quantas Threads deseja criar?");
        int quantidade = input.nextInt();

        Runtime runtime = Runtime.getRuntime();

        long inicio = System.nanoTime();

        long memoriaAntes = runtime.totalMemory() - runtime.freeMemory();

        MinhaThread[] threads = new MinhaThread[quantidade];

        for (int i = 0; i < quantidade; i++) {
            threads[i] = new MinhaThread(operacao);
            threads[i].start();
        }

        for (int i = 0; i < quantidade; i++) {
            threads[i].join();
        }

        long fim = System.nanoTime();

        long memoriaDepois = runtime.totalMemory() - runtime.freeMemory();

        double tempoSegundos = (fim - inicio) / 1_000_000_000.0;

        System.out.println("\nTodas as " + quantidade + " threads foram finalizadas");
        System.out.println("Tempo: " + tempoSegundos + " segundos");
        System.out.println("Memória usada: " + ((memoriaDepois - memoriaAntes) / 1024) + " KB");

        input.close();
    }
}