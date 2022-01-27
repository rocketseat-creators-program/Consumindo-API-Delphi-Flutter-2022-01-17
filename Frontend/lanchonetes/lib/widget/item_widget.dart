import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:lanchonetes/models/category_model.dart';

class ItemWidget extends StatelessWidget {
  final CategoryModel model;

  const ItemWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  _buildBackground() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            image: DecorationImage(
              image: NetworkImage(model.url),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                model.nome,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      elevation: 15,
      child: _buildBackground(),
    );
  }
}
