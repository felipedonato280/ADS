public class FolhaDePagamento {
    private Funcionario funcionario;

    // CONSTRUCTOR

    public FolhaDePagamento(Funcionario funcionario) {
        this.funcionario = funcionario;
    }

    // METODO PRINCIPAL

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();

        sb.append("================== Folha de pagamento ==================\n");
        sb.append(String.format("Funcionário: %-25s CPF: %s%n", funcionario.getNome(), funcionario.getCpf()));
        sb.append(String.format("Cargo: %-31s Dependentes: %d%n", funcionario.getCargo(), funcionario.getNumeroDependentes()));
        sb.append("----------------------------------------------------------\n");
        sb.append(String.format("%-30s %s%n", "Descrição", "Valor"));
        sb.append("----------------------------------------------------------\n");
        sb.append("                       Rendimentos\n");
        sb.append("----------------------------------------------------------\n");
        sb.append(String.format("%-30s R$ %.2f%n", "Vencimento básico", funcionario.getSalario()));
        sb.append("----------------------------------------------------------\n");
        sb.append("                        Descontos\n");
        sb.append("----------------------------------------------------------\n");
        sb.append(String.format("%-30s R$ %.2f%n", "Seguridade social", getDescontoINSS()));
        sb.append(String.format("%-30s R$ %.2f%n", "Imposto de renda retido na fonte", getDescontoIRPF()));
        sb.append("----------------------------------------------------------\n");
        sb.append(String.format("Salário líquido: R$ %.2f%n", getSalarioLiquido()));
        sb.append("##########################################################");

        return sb.toString();
    }

    // GETTERS

    public double getDescontoINSS() {
        Imposto inss = new Inss();
        return inss.calcular(funcionario.getSalario());
    }

    public double getDescontoIRPF() {
        Imposto ir = new ImpostoRenda(getDescontoINSS(), funcionario.getNumeroDependentes());
        return ir.calcular(funcionario.getSalario());
    }

    public double getSalarioLiquido() {
        return funcionario.getSalario() - getDescontoINSS() - getDescontoIRPF();
    }
}