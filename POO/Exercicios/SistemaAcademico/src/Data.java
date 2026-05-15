class Data {
    private int dia;
    private int mes;
    private int ano;

    public Data (int dia, int mes) {
        setMes(mes);
        setDia(dia);
    }

    public Data (int dia, int mes, int ano) {
        this(dia, mes);
        setAno(ano);
    }

    public void setDia(int dia) {

        // Array com quantidade de dias por mês
        int diasMes[] = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

        // Validação baseada no mês atual
        if (dia >= 1 && dia <= diasMes[this.mes]) {
            this.dia = dia;
        } else {
            System.out.printf("Dia inválido");
            this.dia = 1; // valor padrão
        }
    }

    public int getDia() {
        return dia;
    }


    public void setAno(int ano) {

        // Validação simples: ano não pode ser negativo
        if (ano >= 0) {
            this.ano = ano;
        } else {
            System.out.printf("Ano inválido");
            this.ano = 1900;
        }
    }


    public int getAno(){
        return ano;
    }


    public void setMes(int mes) {

        // Mês deve estar entre 1 e 12
        if (mes >= 1 && mes <= 12){
            this.mes = mes;
        } else {
            System.out.printf("Mês é inválido \n");
            this.mes = 1;
        }
    }


    public int getMes() {
        return mes;
    }

    public String escreverAbreviado(){

        if (ano == 0)
            return dia + "/" + mes;

        return dia + "/" + mes + "/" + ano;
    }


    public String escreverExtenso() {

        String meses[] = {
                "", "janeiro", "fevereiro", "março", "abril", "maio",
                "junho", "julho", "agosto", "setembro",
                "outubro", "novembro", "dezembro"};

        return dia + " de " + meses[mes] + " de " + ano;
    }


    public static void main (String args[]) {

        Data hoje = new Data(15, 14, 2026);

        Data aulasPOO[] = new Data[5];

        aulasPOO[0] = new Data(1, 4, 2026);
        aulasPOO[1] = new Data(8, 4, 2026);
        aulasPOO[2] = new Data(15, 4, 2026);
        aulasPOO[3] = new Data(22, 4, 2026);
        aulasPOO[4] = new Data(29, 4, 2026);

        System.out.println( hoje.escreverAbreviado() );
        System.out.println( hoje.escreverExtenso() );

        System.out.printf("A avalição ficou marcada para %s \n", aulasPOO[3].escreverExtenso() );
        System.out.println("As aulas de POO em abril serão nas seguintes datas \n");

        for (int i = 0; i < aulasPOO.length; i++){
            System.out.printf("%s \n", aulasPOO[i].escreverAbreviado() );
        }
    }
}