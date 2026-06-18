import java.time.YearMonth;

public class ContaCorrente extends Conta{
	private float limite;
	private float tarifa;
	private int quantidadeSaques;
	private YearMonth periodoAtual;

	private static final int LIMITE_SAQUES = 4;
	private static final float ADICIONAL_SAQUE = 3;
		
	public ContaCorrente(Pessoa cliente){
		super(cliente);
	
		if (cliente instanceof PessoaJuridica){
			this.limite = 3000f;
		} else {
			this.limite = 200f;
		}

		this.tarifa = 0f;
		this.quantidadeSaques = 0;
		this.periodoAtual = YearMonth.now();

	}

	// O metodo sacar é reimplementado, pois ele tem funcinamento diferente (polimorfismo). O saque da conta corrente leva em conta também o limite disponível do cliente
	public void sacar(float valor){
		YearMonth periodoSaque = YearMonth.now();

		if(valor <= 0){
			System.out.println("VALOR INVÁLIDO");
			return;
		}

		if(valor > saldo + limite){
			System.out.println("VOCE NÃO POSSUI SALDO E LIMITE PARA REALIZAR O SAQUE");
			return;
		}

		saldo -= valor;

		if(periodoSaque.equals(periodoAtual)){
			quantidadeSaques++;
		} else {
			periodoAtual = periodoSaque;
			tarifa = 0f;
			quantidadeSaques = 1;
		}

		if(quantidadeSaques > LIMITE_SAQUES){
			tarifa += ADICIONAL_SAQUE;
			saldo -= ADICIONAL_SAQUE;
			System.out.println("Tarifa adicional aplicada: R$" + ADICIONAL_SAQUE);
		}
	}

	@Override
	public void imprimirExtrato(){
		// usando a referencia super para acessar o metodo da superclasse. ao chamar o metodo sem usar a referência, cria um loop infinito, pois será executado o método da classe atual
		super.imprimirExtrato();	
		System.out.println("Limite: " + limite);
		System.out.println("Saques realizados no mês: " + quantidadeSaques);
		System.out.println("Tarifa sobre saques: R$ " + tarifa);
	}

	public float getLimite() {
		return limite;
	}

	public float getTarifa() {
		return tarifa;
	}

	public int getQuantidadeSaques(){
		return quantidadeSaques;
	}
}