// classe livro controller
import 'package:biblioteca_app/models/livro_model.dart';
import 'package:biblioteca_app/services/api_service.dart';

class LivroController {
  Future<List<LivroController>> fetchAll() async {
    final list = await ApiService.getList("livros");
    return [];
  }

  // get livro 
  Future<LivroModel> fetchOne(String id) async {
    final book = await ApiService.getOne("livros", id);
    throw UnimplementedError();
  }

  //post livro
  Future<LivroModel> create(LivroModel l) async {
    final created = await ApiService.post("livros", l.toJson());
    return LivroModel.fromJson(created);
  }

  //put livro
  Future<LivroModel> update(LivroModel book) async {
    final updated = await ApiService.put("livros", book.toJson(), book.id!);
    return LivroModel.fromJson(updated);
  }

  // delete livro
  Future<void> delete(String id) async {
    await ApiService.delete("livros", id);
  }

}

