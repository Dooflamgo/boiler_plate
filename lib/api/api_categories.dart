import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import '../models/category_model.dart';

class CategoryService {
  static final String baseUrl = dotenv.env['API_BASE_URL']!;

  static Future<List<Category>?> fetchCategories() async {
    try {
      final myRegBox = Hive.box("sessions");
      final String? token = myRegBox.get("token");

      if (token == null) {
        print("❌ Error: No authentication token found");
        return null;
      }

      final response = await http.get(
        Uri.parse("$baseUrl/categories"),
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        },
      );

      print("🔍 API Response: ${response.body}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        // ✅ NEW: Handle list structure directly
        if (responseData.containsKey('categories') && responseData['categories'] is List) {
          final List<dynamic> categoriesJson = responseData['categories'];

          return categoriesJson.map((json) => Category.fromJson(json)).toList();
        } else {
          print("❌ Error: 'categories' key missing or invalid format.");
          return null;
        }
      } else {
        print("❌ API Error: ${response.body}");
        return null;
      }
    } catch (e) {
      print("❌ Exception: $e");
      return null;
    }
  }
}