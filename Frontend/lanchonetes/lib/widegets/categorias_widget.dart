import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lanchonetes/models/categoria_model.dart';
import 'package:lanchonetes/repositories/categorias_repository.dart';

class CategoriasWidget extends StatelessWidget {
  final repository = CategoriasRepository();

  CategoriasWidget({Key? key}) : super(key: key);

  _buildImage(CategoriaModel categoriaModel) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(categoriaModel.url),
        ),
      ),
    );
  }

  _buildTitle(CategoriaModel categoriaModel) {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            categoriaModel.nome,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoriaModel>>(
        future: repository.fetchCategorias(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return _buildListaCategorias(snapshot.data!);
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Erro ao buscar categorias!',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  GridView _buildListaCategorias(List<CategoriaModel> lista) {
    return GridView.builder(
      itemCount: 5,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        var model = lista[index];
        return Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          elevation: 15,
          child: Stack(
            children: [
              _buildImage(model),
              _buildTitle(model),
            ],
          ),
        );
      },
    );
  }
}
