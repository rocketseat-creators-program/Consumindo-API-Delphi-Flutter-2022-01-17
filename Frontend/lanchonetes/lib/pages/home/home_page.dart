import 'package:flutter/material.dart';
import 'package:lanchonetes/widgets/categorias_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
        centerTitle: true,
      ),
      body: CategoriasWidget(),
    );
  }
}
