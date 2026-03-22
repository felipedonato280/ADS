public class Data {
    int dia;
    int mes;
    int ano;

    // Criando o metodo construtor da classe

    public Data(int dia, int mes, int ano){
        this.dia = dia;
        this.mes = mes;
        this.ano = ano;
    }

    // Fazendo uma sobrecarga de metodo

    public Data(int dia, int mes){
        this.dia = dia;
        this.mes = mes;
    }

    public String toString(){
        if (ano == 0)
            return dia + "/" + mes;

        return dia + "/" + mes + "/" + ano;
    }

    public static void main(String[]args){

        Data hoje = new Data(11,3,2026);
        Data amanha = new Data(12,3);
        System.out.println(hoje.toString());
        System.out.println(amanha.toString());

        hoje.dia = 15;
        hoje.mes = 4;
        hoje.ano = 2026;

        System.out.print(hoje.toString());
    }
}