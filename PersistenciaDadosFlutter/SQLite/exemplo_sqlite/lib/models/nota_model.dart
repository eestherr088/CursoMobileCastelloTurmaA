// criar a classe model para Notas
class Nota{
  //atributos 
  final int? id;  // permite criar objeto com id nulo
  final String titulo;
  final String conteudo;

  //construtor
  Nota({this.id, required this.titulo, required this.conteudo});  // construtor com os atributos, required é obrigatório

  // métodos
  // converter dados para o banco de dados
  // método MAP => converte um objeto da classe Nota para um Map(para inserir no banco de dados)
  // map é uma lista (chave associada a um valor), lista nao ordenada
  Map<String,dynamic>toMap(){
    return {
      "id" : id,
      "titulo" : titulo,
      "conteudo" : conteudo
    };
  }

  // factory -> converte dados do banco de dados para um objeto
  factory Nota.fromMap(Map<String,dynamic> map) {
    return Nota (
      id: map["id"] as int,  // cast (conversao de dados)
      titulo: map["titulo"] as String,  // string texto
      conteudo: map["conteudo"] as String);
  }

// to String
@override
String toString() {
  // TODO: implement to String
  return "Nota{id: %id, Título: $titulo, Conteúdo: $conteudo}";
}

}