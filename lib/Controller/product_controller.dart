import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intern_project/Models/product_data_model.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var products = <ProductModel>[].obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      final response =
          await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body) as List;
        products.value =
            data.map((json) => ProductModel.fromJson(json)).toList();
      } else {
        errorMessage.value = "Failed to load products";
      }
    } catch (e) {
      errorMessage.value = "Error: $e";
    } finally {
      isLoading.value = false;
    }
  }
}
