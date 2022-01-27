import 'dart:convert';

class CategoryModel {
  final String nome;
  final String url;

  CategoryModel({required this.nome, required this.url});

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'url': url,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      nome: map['nome'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));
}
