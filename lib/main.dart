import 'package:app_movil_coffe/src/screens/home_screen.dart';
import 'package:app_movil_coffe/src/screens/informe_maquina_screen.dart';
import 'package:app_movil_coffe/src/screens/informe_screen.dart';
import 'package:app_movil_coffe/src/screens/login_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: LoginScreen(),
      ),
    );
  }
}
