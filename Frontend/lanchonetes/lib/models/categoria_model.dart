import 'dart:convert';

class CategoriaModel {
  final String nome;
  final String url;

  CategoriaModel({required this.nome, required this.url});

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'url': url,
    };
  }

  factory CategoriaModel.fromMap(Map<String, dynamic> map) {
    return CategoriaModel(
      nome: map['nome'] ?? '',
      url: map['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriaModel.fromJson(String source) =>
      CategoriaModel.fromMap(json.decode(source));
}
