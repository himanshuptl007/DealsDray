import 'package:flutter_application/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'http://devapiv2.dealsdray.com/api/v2/user/home/withoutPrice';
  
  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));
    
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      List<Product> products = [];

      for (var item in jsonData) {
        products.add(Product.fromJson(item));
      }

      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
