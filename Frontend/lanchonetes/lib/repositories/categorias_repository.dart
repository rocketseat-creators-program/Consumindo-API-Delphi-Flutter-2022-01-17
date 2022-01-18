import 'package:dio/dio.dart';
import 'package:lanchonetes/models/categoria_model.dart';

class CategoriasRepository {
  final dio = Dio();

  Future<List<CategoriaModel>> fetchCategorias() async {
    try {
      final response = await dio.get('http://localhost:9000/categorias');
      final list = response.data as List;
      return list.map((e) => CategoriaModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
