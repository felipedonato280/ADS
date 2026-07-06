public class Inss extends Imposto {
    private static final double[] LIMITES   = {1621.00, 2902.84, 4354.27, 8475.55};
    private static final double[] ALIQUOTAS = {0.075,   0.09,    0.12,    0.14};

    // METODOS PRINCIPAIS

    @Override
    public double calcular(double salario){
        double salarioBase = Math.min(salario, LIMITES[LIMITES.length - 1]); // aplica o teto
        double desconto = 0;
        double anterior = 0;

        for (int i = 0; i < LIMITES.length; i++){
            if (salarioBase > anterior){
                double faixaSuperior = Math.min(salarioBase, LIMITES[i]);
                desconto += (faixaSuperior - anterior) * ALIQUOTAS[i];
                anterior = faixaSuperior;
            } else {
                break;
            }
        }
        return desconto;
    }
}