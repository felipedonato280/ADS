public class ProcessoExecutando {

    public static double raiz(long numero) {
        double x = 0;

        for (long i = 0; i < numero; i++) {
            x += Math.sqrt(i);
        }
        return x;
    }

    public static void mostrarSoma(long numero) {
        long soma = 0;

        for (int i = 1; i <= numero; i++) {
            soma += i;
            System.out.println("PID " + ProcessHandle.current().pid() + " -> " + soma);
        }
    }

    public static void main(String[] args) {

        int operacao = Integer.parseInt(args[0]);

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

        System.out.println("Processo finalizado: " + ProcessHandle.current().pid());
    }
}