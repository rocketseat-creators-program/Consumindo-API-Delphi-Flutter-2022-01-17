import 'package:dio/dio.dart';
import 'package:lanchonetes/models/category_model.dart';

class CategoryRepository {
  final dio = Dio();

  Future<List<CategoryModel>> fetchCategory() async {
    try {
      final response = await dio.get('http://localhost:9000/categorias');
      final list = response.data as List;
      return list.map((e) => CategoryModel.fromMap(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
