import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkAuth(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          if (snapshot.data == true) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
            });
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushNamedAndRemoveUntil(
                  context, "/login", (route) => false);
            });
          }
          return const SizedBox.shrink();
        }
      },
    );
  }

  Future<bool> _checkAuth() async {
    final myRegBox = Hive.box("sessions");
    final token = myRegBox.get("token");
    return token != null;
  }
}
