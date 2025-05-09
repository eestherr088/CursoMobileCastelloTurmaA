package Model;

public class Professor extends Pessoa {
    //atributos (encapsulamento)
    private String salario;
    //métodos
    //construtor

    public Professor(String nome, String cpf, String salario) {
        super(nome, cpf);
        this.salario = salario;
    }
    //getters and setters

    public String getSalario() {
        return salario;
    }

    public void setSalario(String salario) {
        this.salario = salario;
    }
    //exibirInformações
    @Override   //polimorfismo
    public void exibirInformacoes() {
        super.exibirInformacoes();
        System.out.println("Salário: "+salario);
    }
}
