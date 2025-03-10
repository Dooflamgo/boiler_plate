import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class ProfileService {
  static final String baseUrl = dotenv.env['API_BASE_URL']!;

  /// Fetch user profile data from API
  static Future<Map<String, dynamic>?> fetchUserProfile() async {
    try {
      final myRegBox = Hive.box("sessions");
      final String? token = myRegBox.get("token");

      if (token == null) {
        print("Error: No authentication token found");
        return null;
      }

      String apiUrl = "$baseUrl/user/profile";
      var response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        // Check if required fields are missing
        if (!data.containsKey('id') || !data.containsKey('name') || !data.containsKey('email')) {
          print("Error: Missing required fields in API response");
          return null;
        }

        return {
          "id": data["id"],
          "name": data ["name"],
          "email": data["email"],
        };
      } else {
        print("Error: Failed to fetch user profile - ${response.body}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }
}