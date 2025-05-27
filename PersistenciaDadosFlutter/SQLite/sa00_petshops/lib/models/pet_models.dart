class Pet{
  // atributos -> id, nome, raça, nomeDono, telefoneDono
  final int?  id;  // final: é uma constante, não pode ser alterada depois de inicializada, com "?" pode ser nulo
  final String nome;
  final String raca;
  final String nomeDono;
  final String telefone;

  // métodos de acesso publico (getters and setters) CASO ATRIBUTOS FOSSEM PRIVADOS
   // getId() {
   // return id;
   // }

   // setId() {
  //   this.id = id;
 // }

 // construtor 
 Pet({
  this.id,
  required this.nome,
  required this.raca,
  required this.nomeDono,
  required this.telefone,
 });

 // métodos de conversão OBJ <-> BD
 // toMap() -> converte o objeto para um mapa (usado para inserir no banco de dados)
 Map<String,dynamic> toMap() {
  return {
    "id" : id,
    "nome" : nome,  
    "raca" : raca,
    "nome_dono" : nomeDono,
    "telefone" : telefone,
  };
 }
 
 // fromMap BD - ibj
factory Pet.fromMap(Map<String, dynamic> map) {
  return Pet(
    id: map["id"] as int,
    nome: map["nome"] as String,
    raca: map["raca"] as String,
    nomeDono: map["nome_dono"] as String,
    telefone: map["telefone"] as String);
 }

 @override
  // TODO: implement toString
 String toString() {
  return "Pet(id: $id, nome: $nome, raca: $raca, nomeDono: $nomeDono, telefone: $telefone)";
 }

}