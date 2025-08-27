// classe emprestimo controller
import 'package:biblioteca_app/models/livro_model.dart';
import 'package:biblioteca_app/services/api_service.dart';

class EmprestimoModel {
  Future<List<EmprestimoModel>> fetchAll() async {
    final list = await ApiService.getList("emprestimo");
    return [];
  }

  // get emprestimo 
  Future<EmprestimoModel> fetchOne(String id) async {
    final emprestimo = await ApiService.getOne("emprestimo", id);
    throw UnimplementedError();
  }

  //post emprestimo
  Future<EmprestimoModel> create(EmprestimoModel l) async {
    final created = await ApiService.post("emprestimo", e.toJson());
    return EmprestimoModel.fromJson(created);
  }

  //put emprestimo
  Future<EmprestimoModel> update(EmprestimoModel emprestimo) async {
    final updated = await ApiService.put("emprestimo", emprestimo.toJson(), emprestimo.id!);
    return EmprestimoModel.fromJson(updated);
  }

  // delete emprestimo
  Future<void> delete(String id) async {
    await ApiService.delete("emprestimo", id);
  }

}

