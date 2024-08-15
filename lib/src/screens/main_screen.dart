import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final Map<String, dynamic> userData;

  MainScreen({required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Bienvenido, ${userData['nombreCompleto']}!'),
      ),
    );
  }
}