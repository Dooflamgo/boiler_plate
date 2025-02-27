import 'package:boiler_plate/pages/home_page.dart';
import 'package:boiler_plate/pages/profile_page.dart';
import 'package:boiler_plate/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
        primaryColor: Colors.blueAccent,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
