import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductService {
  static const String baseUrl = 'https://dummyjson.com';

  Future<ProductListResponse> fetchProducts({int limit = 10, int skip = 0}) async {
    final url = Uri.parse('$baseUrl/products?limit=$limit&skip=$skip');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return ProductListResponse.fromJson(jsonData);
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<ProductListResponse> searchProducts(String query) async {
    final url = Uri.parse('$baseUrl/products/search?q=$query');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return ProductListResponse.fromJson(jsonData);
    } else {
      throw Exception('Failed to search products');
    }
  }
}
