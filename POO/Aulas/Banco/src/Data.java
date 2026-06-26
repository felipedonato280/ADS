public class Data {
	private int dia;
	private int mes;
	private int ano;

	// CONSTRUCTOR

	public Data (int dia, int mes) {
		setMes(mes);
		setDia(dia);
	}

	public Data (int dia, int mes, int ano){
		// validação do mes

		setMes(mes);

		setDia(dia);

		setAno(ano);

	}

	// METODOS PRINCIPAIS

	public String escreverPorExtenso(){
		String meses[] = {"janeiro", "fevereiro", "março", "abril", "maio", "junho", "julho",	"agosto", "setembro", "outubro", "novembro", "dezembro"};

		return dia + " de " + meses[mes-1] + " de " + ano;
	}

	public String escreverAbreviado(){

		if (ano == 0)
			return dia + "/" + mes;

		return dia + "/" + mes + "/" + ano;
	}

	public void ajustarData(int dia, int mes, int ano){

		setMes(mes);

		setDia(dia);

		setAno(ano);

	}

	public boolean ehBissexto(int ano){
		if ((ano % 4 == 0 && ano % 100 != 0) || (ano % 400 == 0)){
			return true;
		}

		return false;
	}

	// SETTERS

	public void setDia(int dia) {
		int diasMes[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

		if (dia >=1 && dia <= diasMes[this.mes-1]){
			this.dia = dia;
		} else {
			System.out.printf("Dia inválido\n");
			this.dia = 1;
		}
	}

	public void setMes(int mes) {
		// validação do mes
		if (mes >= 1 && mes <= 12){
			this.mes = mes;
		} else {
			System.out.printf("Mês inválido\n");
			this.mes = 1;
		}
	}

	public void setAno(int ano){
		if (ano > 1900){
			this.ano = ano;
		} else {
			System.out.printf("Ano inválido\n");
			this.ano = 2000;
		}
	}

	// GETTERS

	public int getDia() {
		return dia;
	}
	
	public int getMes(){
		return mes;
	}
	
	public int getAno() {
		return ano;
	}
	
	/*public static void main (String args[]) {
		// criando uma instancia da classe
		Data hoje = new Data(26, 3, 2024);

		hoje.ajustarData(3, 4, 2024);

		System.out.printf("Hoje é %s", hoje.escreverPorExtenso() );

		int ano = 1800;
		System.out.printf("%d é bissexto: %s", ano, hoje.ehBissexto(ano) );
	}*/
}