import 'package:boiler_plate/pages/home_page.dart';
import 'package:boiler_plate/pages/profile_page.dart';
import 'package:boiler_plate/pages/login_page.dart';
import 'package:boiler_plate/pages/hoodie_page.dart';
import 'package:boiler_plate/pages/accessories_page.dart';
import 'package:boiler_plate/pages/jacket_page.dart';
import 'package:boiler_plate/pages/shoes_page.dart';
import 'package:boiler_plate/pages/shorts_page.dart';
import 'package:boiler_plate/pages/windbreaker_page.dart';
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
        '/hoodies': (context) => const HoodiePage(),
        '/accessories': (context) => const AccessoriesPage(),
        '/jackets': (context) => const JacketPage(),
        '/shoes': (context) => const ShoesPage(),
        '/shorts': (context) => const ShortsPage(),
        '/windbreakers': (context) => const WindbreakerPage(),
      },
    );
  }
}
