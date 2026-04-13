import java.util.Scanner;

public class Horario {

    int hora;
    int minutos;

    public Horario(int hora, int minutos){
        this.hora = hora;
        this.minutos = minutos;
    }

    public Horario() {
    }

    public void lerTeclado(Scanner input, String tipo) {
        do {
            System.out.println("Informe as horas "+ tipo +" (0-23): ");
            hora = input.nextInt();
        } while (hora < 0 || hora > 23);

        do {
            System.out.println("Informe os minutos "+ tipo +" (0-59): ");
            minutos = input.nextInt();
        } while (minutos < 0 || minutos > 59);
    }

    public int paraMinutos(){
        return hora * 60 + minutos;
    }

    public static int calcularDiferenca(Horario inicio, Horario fim){
        int minutosInicio = inicio.paraMinutos();
        int minutosFim = fim.paraMinutos();

        if (minutosFim < minutosInicio) {
            minutosFim += 24 * 60;
        }

        return minutosFim - minutosInicio;
    }

    public static void main(String[] args){
        Scanner input = new Scanner(System.in);

        Horario inicio = new Horario();
        inicio.lerTeclado(input, "inicio");

        Horario fim = new Horario();
        fim.lerTeclado(input, "fim");

        input.close();

        int intervalo = Horario.calcularDiferenca(inicio, fim);
        System.out.println("O intervalo resultante é de " + intervalo + " minutos");
    }
}