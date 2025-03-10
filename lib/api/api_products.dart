import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

class ProductService {
  static final String baseUrl = dotenv.env['API_BASE_URL']!;

  /// Fetch all products from the API
  static Future<List<Product>> fetchProductsByCategory(int categoryId) async {
    try {
      final url = "$baseUrl/products?category_id=$categoryId"; // ✅ Correct URL
      print("Fetching products from: $url"); // ✅ Print full request URL

      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
        },
      );

      print("Response Code: ${response.statusCode}"); // ✅ Debugging
      print("Response Body: ${response.body.length > 500 ? response.body.substring(0, 500) : response.body}"); // ✅ Fix substring crash

      if (response.statusCode == 200) {
        try {
          final Map<String, dynamic> data = jsonDecode(response.body);
          final List<dynamic> productList = data['products'];

          return productList.map((json) => Product.fromJson(json)).toList();
        } catch (e) {
          throw Exception('Error parsing JSON: ${response.body}');
        }
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }
}
