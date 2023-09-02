import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        elevation: 5,
        title: const Text(
          "New Screen",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(data),
      ),
    );
  }
}
