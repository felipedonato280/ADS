class PessoaJuridica extends Pessoa{
	private String nomeFantasia;
	private String cnpj;

	// CONSTRUCTOR

	public PessoaJuridica(String nomeFantasia, String cnpj, String nome, Data nascimento, String endereco){
		super(nome, nascimento, endereco);
		this.nomeFantasia = nomeFantasia;
		this.cnpj = cnpj;
	}

	// METODOS PRINCIPAIS

	@Override
	public String toString(){
		String msg = "";
		msg += "Nome fantasia " + nomeFantasia + "\n";
		msg += "Razão social " + nome + "\n";
		msg += "Data de abertura " + nascimento.escreverAbreviado() + "\n";
		msg += "Endereço " + endereco + "\n";
		msg += "CNPJ " + cnpj + "\n";

		return msg;
	}

	// SETTERS

	public void setCnpj(String cnpj){
		// PARA FAZER
	}

	// GETTERS

	public String getCnpj(){
		return cnpj;
	}
}