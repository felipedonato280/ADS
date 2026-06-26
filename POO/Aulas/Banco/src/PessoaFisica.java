class PessoaFisica extends Pessoa{
	private String cpf;
	private String rg;

	// CONSTRUCTOR

	public PessoaFisica(String cpf, String rg, String nome, Data nascimento, String endereco){
		super(nome, nascimento, endereco);

		setRg(rg);
		
		if (CpfCnpjUtils.isValidCPF(cpf))
			this.cpf = cpf;
		else
			System.out.println("CPF inválido: será necessário atualizar o documento para validar o cadastro.");
	}

	// METODOS PRINCIPAIS

	@Override
	public String toString(){
		String msg = "";
		msg += "Nome: " + nome + "\n";
		msg += "Nascimento: " + nascimento.escreverAbreviado() + "\n";
		msg += "CPF: " + cpf + "\n";
		msg += "RG: " + rg + "\n";

		return msg;
	}

	// SETTERS

	public void setRg(String rg){
		this.rg = rg;
	}

	// GETTERS

	public String getCpf(){
		return cpf;
	}
	
	public String getRg(){
		return rg;
	}
}