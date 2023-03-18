import 'dart:convert';

import 'package:flutter_bloc_get/models/product_model.dart';
import 'package:http/http.dart';

class ProductRepository {
  String endpoint = 'https://fakestoreapi.com/products';

  Future<List<ProductModel>> getProducts() async {
    Response response = await get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);

      return result.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
