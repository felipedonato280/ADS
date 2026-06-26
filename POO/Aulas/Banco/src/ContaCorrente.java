import java.time.YearMonth;
// import da biblioteca time, antes estava usando apenas month
// mas causava um bug, como nao guardava o ano, se fossem meses iguais de anos diferentes contabilizava a tarifa.

public class ContaCorrente extends Conta{
	private static final int LIMITE_SAQUES_GRATIS = 4;      // Constante para armazenar o limite de saques por mes
	private static final float TARIFA_SAQUE_EXCEDENTE = 3f; // Constante para armazenar o valor da tarifa (bigdecimal seria a melhor pratica)

	private float limite;
	private float tarifasAcumuladasMes;  // valor das tarifas acumuladas no mes
	private int quantidadeSaques;        // Guarda a quantidade de saques do mes
	private YearMonth periodoAtual;      // Guarda o ano/mes atual

	// CONSTRUCTOR

	public ContaCorrente(Pessoa cliente){
		super(cliente);
	
		if (cliente instanceof PessoaJuridica){
			this.limite = 3000f;
		} else {
			this.limite = 200f;
		}

		this.tarifasAcumuladasMes = 0f;       // Inicia o valor acumulado de tarifas na abertura da conta
		this.quantidadeSaques = 0;            // Inicia a quantidade de saques realizadas na abertura da conta
		this.periodoAtual = YearMonth.now();  // Inicia o periodo atual com base na criacao da conta

	}

	// METODOS PRINCIPAIS

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

		if(periodoSaque.equals(periodoAtual)){  // Se a data do saque for igual ao periodo atual, atualiza a contagem
			quantidadeSaques++;
		} else {
			periodoAtual = periodoSaque;  // Se nao, atualiza o periodo atual, com a data do saque
			tarifasAcumuladasMes = 0f;
			quantidadeSaques = 1;
		}

		float valorTotal = valor;

		if(quantidadeSaques > LIMITE_SAQUES_GRATIS){
			tarifasAcumuladasMes += TARIFA_SAQUE_EXCEDENTE;
			valorTotal += TARIFA_SAQUE_EXCEDENTE;
			System.out.println("Tarifa adicional aplicada: R$" + TARIFA_SAQUE_EXCEDENTE);
		}

		saldo -= valorTotal;
	}

	@Override
	public void imprimirExtrato(){
		// usando a referencia super para acessar o metodo da superclasse. ao chamar o metodo sem usar a referência, cria um loop infinito, pois será executado o metodo da classe atual
		super.imprimirExtrato();	
		System.out.println("Limite: " + limite);
		System.out.println("Saques realizados no mês: " + quantidadeSaques);
		System.out.println("Tarifa sobre saques: R$ " + tarifasAcumuladasMes);
	}

	// GETTERS

	public float getLimite() {
		return limite;
	}

	public float getTarifa() {
		return tarifasAcumuladasMes;
	}

	public int getQuantidadeSaques(){
		return quantidadeSaques;
	}
}