public class ImpostoRenda extends Imposto {
    private static final double DEDUCAO_POR_DEPENDENTE = 189.50;

    private double descontoINSS;
    private int dependentes;

    // CONSTRUCTOR

    public ImpostoRenda(double descontoINSS, int dependentes){
        this.descontoINSS = descontoINSS;
        this.dependentes = dependentes;
    }

    // METODOS PRINCIPAIS

    @Override
    public double calcular(double salario){
        // Base já reduzindo INSS e dependentes
        double base1 = salario - descontoINSS - (DEDUCAO_POR_DEPENDENTE * dependentes);

        // Tabela 1 (nova) - isenção até R$ 5.000
        if (base1 <= 5000.00){
            return 0;
        }

        double reducao = 0;
        if (base1 <= 7350.00){
            reducao = 978.62 - (0.133145 * base1);
            if (reducao < 0) reducao = 0;
        }
        // Se base1 > 7350, não há redução (reducao = 0), usa Tabela 2 direto

        double base2 = base1 - reducao;

        double aliquota;
        double deducao;

        if (base2 <= 2428.80){
            aliquota = 0;
            deducao = 0;
        } else if (base2 <= 2826.65){
            aliquota = 0.075;
            deducao = 182.16;
        } else if (base2 <= 3751.05){
            aliquota = 0.15;
            deducao = 394.16;
        } else if (base2 <= 4664.68){
            aliquota = 0.225;
            deducao = 675.49;
        } else {
            aliquota = 0.275;
            deducao = 908.73;
        }

        double imposto = (base2 * aliquota) - deducao;
        return Math.max(imposto, 0);
    }
}