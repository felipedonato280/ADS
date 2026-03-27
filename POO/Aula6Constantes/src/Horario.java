import java.util.Scanner;

public class Horario {

    int hora;
    int minutos;

    public Horario(int hora, int minutos){
        if(hora >= 0 && hora <= 23){
            this.hora = hora;
        }
        else{
            System.out.println("A hora digitada esta incorreta");
        }

        if(minutos >= 0 && minutos <= 59){
            this.minutos = minutos;
        }
        else{
            System.out.println("Os minutos digitados estao incorretos");
        }
    }

    public Horario() {
    }

    public void lerTeclado(){
        Scanner input = new Scanner(System.in);

        System.out.println("Informe as horas: ");
        hora = input.nextInt();

        System.out.println("Informe os minutos: ");
        minutos = input.nextInt();
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
        Horario inicio = new Horario();
        inicio.lerTeclado();

        Horario fim = new Horario();
        fim.lerTeclado();

        int intervalo = calcularDiferenca(inicio, fim);
        System.out.println("O intervalo resultante é de " + intervalo + " minutos");
    }
}