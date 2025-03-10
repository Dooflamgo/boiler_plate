import 'dart:convert';
import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginUser {
  Future<String> logIn({
    required String email,
    required String password,
  }) async {
    final String? baseUrl = dotenv.env['API_BASE_URL'];

    if (baseUrl == null) {
      print("❌ ERROR: API_BASE_URL is not set in .env!");
      return 'error';
    }

    final String apiUrl = '$baseUrl/login';
    print("🔍 Sending request to: $apiUrl");
    print("🔍 Request Body: ${jsonEncode({'email': email, 'password': password})}");

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({'email': email, 'password': password}),
      ).timeout(const Duration(seconds: 10));

      print("🔍 Response Code: ${response.statusCode}");
      print("🔍 Response Body: ${response.body}");

      final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        final String? token = responseData['token']; // Fix key from 'access_token'

        if (token == null) {
          print("❌ ERROR: Token is null!");
          return 'error';
        }

        final myRegBox = Hive.box('sessions');

        print("✅ Storing Token: $token");
        await myRegBox.put('token', token);

        final String emailStored = responseData['email'] ?? ""; // Handle missing email
        print("✅ Storing Email: $emailStored");
        await myRegBox.put('email', emailStored);

        Fluttertoast.showToast(msg: "Login successful!");
        return 'success';
      } else if (response.statusCode == 401) {
        print("❌ Invalid credentials: ${responseData['message']}");
        Fluttertoast.showToast(msg: responseData['message'] ?? "Invalid credentials");
        return 'wrong-password';
      } else {
        print("❌ Login failed: ${responseData['message']}");
        Fluttertoast.showToast(msg: "Login failed: ${responseData['message']}");
        return 'error';
      }
    } catch (error) {
      print("❌ Login API error: $error");
      Fluttertoast.showToast(msg: "An error occurred: $error");
      return 'error';
    }
  }
}

class LogoutUser {
  Future<String> logOut() async {
    final String? baseUrl = dotenv.env['API_BASE_URL'];

    if (baseUrl == null || baseUrl.isEmpty) {
      Fluttertoast.showToast(msg: "API base URL not set.");
      return 'error';
    }

    final String apiUrl = "$baseUrl/logout";

    try {
      final myRegBox = Hive.box('sessions'); // Ensure box is open
      String? token = myRegBox.get('token');

      if (token == null) {
        Fluttertoast.showToast(msg: "User not logged in.");
        return 'error';
      }

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ).timeout(const Duration(seconds: 10)); // ⏳ Increased timeout

      final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        // ✅ Clear session and remove token
        await myRegBox.clear();

        Fluttertoast.showToast(msg: "Logout successful!");
        return 'success';
      } else {
        Fluttertoast.showToast(
          msg: "Logout failed: ${responseData['message'] ?? 'Unknown error'}",
        );
        return 'error';
      }
    } on TimeoutException {
      Fluttertoast.showToast(msg: "Logout request timed out.");
      return 'timeout';
    } catch (error) {
      Fluttertoast.showToast(msg: "An error occurred: $error");
      return 'error';
    }
  }
}


