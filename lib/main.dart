import 'package:app_movil_coffe/src/provider/user_provider.dart';
import 'package:app_movil_coffe/src/screens/home_screen.dart';
import 'package:app_movil_coffe/src/screens/informe_maquina_screen.dart';
import 'package:app_movil_coffe/src/screens/informe_screen.dart';
import 'package:app_movil_coffe/src/screens/login_screen.dart';
import 'package:app_movil_coffe/src/screens/maquina_screens.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: LoginScreen(),
      ),
    );
  }
}
