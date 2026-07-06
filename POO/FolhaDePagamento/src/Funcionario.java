import java.util.ArrayList;
import java.util.List;

public class Funcionario extends Pessoa{
    private float salario;
    private String cargo;
    private List<Filho> filhos;

    // CONSTRUCTOR

    public Funcionario(String nome, String cpf, float salario){
        super(nome, cpf);
        setSalario(salario);
        this.filhos = new ArrayList<>();
    }

    // CONSTRUCTOR OVERLOAD

    public Funcionario(String nome, String cpf, float salario, String cargo){
        this(nome, cpf, salario);
        setCargo(cargo);
    }

    // METODOS PRINCIPAIS

    public void adicionarFilho(Filho filho){
        if (filho != null){
            filhos.add(filho);
        }
    }

    @Override
    public String toString(){
        String saida = super.toString();

        saida += "Salario: " + salario + "\n";

        if (cargo != null)
            saida += "Cargo: " + cargo + "\n";

        saida += "Dependentes: " + getNumeroDependentes() + "\n";

        return saida;
    }

    // SETTERS

    public void setSalario(float salario){
        if(salario >= 1621){
            this.salario = salario;
        }
        else{
            System.out.println("Salario invalido");
            this.salario = 0.50f;
        }
    }

    public void setCargo(String cargo){
        if(cargo.length() > 5){
            this.cargo = cargo;
        }
        else{
            this.cargo = "Cargo Indefinido";
        }
    }

    // GETTERS

    public float getSalario(){
        return salario;
    }

    public String getCargo(){
        return cargo;
    }

    public int getNumeroDependentes(){
        return filhos.size();
    }
}