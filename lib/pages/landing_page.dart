import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Test',
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.amberAccent, //Tanggalin ko din, not now but soon? HAHA
        centerTitle: true,
      ),
    );
  }
}
