import 'package:flutter/material.dart';
import 'package:flutter_bloc_get/models/product_model.dart';

class DetailProduct extends StatelessWidget {
  const DetailProduct({Key? key, required this.p}) : super(key: key);

  final ProductModel p;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Center(
              child: Image.network(p.image),
            ),
            Text(p.title),
            Text(p.description),
            Text(p.price.toString()),
            Text(p.category),
          ],
        ),
      ),
    );
  }
}
