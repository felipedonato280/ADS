class AppBanco {

	/* 
	 * Classe para testar todas as explicações desenvolvidas em aula 
	 */
	
	public static void main (String args[]) {
	
		PessoaFisica p1 = new PessoaFisica("486.283.190-77", "343243", "Sei la dos santos", new Data(12,2,2005), "Rua teste teste");

		PessoaJuridica p2 = new PessoaJuridica("Hauss Congelados", "38.239.609/0001-90", "Hauss Comercio de congelados LTDA", new Data(15,1,2010), "Rua Taquara taquara");

		ContaCorrente c1 = new ContaCorrente(p2);

		c1.depositar(250);

		c1.sacar(10);
		c1.sacar(10);
		c1.sacar(10);
		c1.sacar(10);
		c1.sacar(10);
		c1.sacar(10);
		c1.sacar(10);

		c1.imprimirExtrato();
	}
}
