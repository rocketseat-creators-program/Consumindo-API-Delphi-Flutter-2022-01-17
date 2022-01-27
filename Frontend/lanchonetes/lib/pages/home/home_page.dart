import 'package:flutter/material.dart';
import 'package:lanchonetes/models/category_model.dart';
import 'package:lanchonetes/repositories/category_repository.dart';
import 'package:lanchonetes/widget/item_widget.dart';

class HomePage extends StatelessWidget {
  final repository = CategoryRepository();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<CategoryModel>>(
        future: repository.fetchCategory(),
        initialData: const [],
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return _buildSucess(snapshot.data!);
          }

          if (snapshot.hasError) {
            return _buildError();
          }

          return _buildLoading();
        },
      ),
    );
  }

  GridView _buildSucess(List<CategoryModel> listCategories) {
    return GridView.count(
      crossAxisCount: 2,
      children: listCategories
          .map((category) => ItemWidget(model: category))
          .toList(),
    );
  }

  Widget _buildError() {
    return const Center(
      child: Text(
        'Erro ao buscar categorias!',
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
