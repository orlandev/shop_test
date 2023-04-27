import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/model.dart';

class ProductService {
  static const String _baseUrl = 'https://dummyjson.com/products';

  Future<ProductList> getProducts() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      return ProductList.fromJson(jsonBody);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
