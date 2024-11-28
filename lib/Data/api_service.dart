import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intern_project/Models/product_data_model.dart';

class ApiService {
  final String _baseUrl = "https://api.escuelajs.co/api/v1/products";

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => ProductModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
