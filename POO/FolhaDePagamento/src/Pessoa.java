public abstract class Pessoa {
    private String nome;
    private String cpf;

    //CONSTRUCTOR

    public Pessoa(String nome, String cpf){
        setNome(nome);
        setCpf(cpf);
    }

    // METODOS PRINCIPAIS

    @Override
    public String toString(){
        String msg = "";
        msg += "Nome: " + nome + "\n";
        msg += "CPF: " + cpf + "\n";
        return msg;
    }

    // SETTERS

    public void setNome(String nome){
        if (nome != null && nome.length() > 10){
            this.nome = nome;
        } else {
            System.out.println("NOME INVÁLIDO. INSIRA UM NOME DO FORMATO \"Nome Sobrenome\"");
            this.nome = "Nome não informado";
        }
    }

    public void setCpf(String cpf){
        if (CpfCnpjUtils.isValidCPF(cpf)){
            this.cpf = cpf;
        } else {
            System.out.printf("O CPF %s é inválido. Verifique a informação \n", cpf);
            this.cpf = "";
        }
    }

    // GETTERS

    public String getNome(){
        return nome;
    }

    public String getCpf(){
        return cpf;
    }
}