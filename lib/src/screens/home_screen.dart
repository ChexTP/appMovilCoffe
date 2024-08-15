import 'package:app_movil_coffe/src/Widgets/card_build.dart';
import 'package:app_movil_coffe/src/Widgets/curva_appbar.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> maquina = ['M01', 'M02', 'M03', 'M04'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: ClipPath(
          clipper: CurveAppBar(),
          child: AppBar(
            toolbarHeight: 70,
            shadowColor: Colors.grey,
            scrolledUnderElevation: 20.0,
            backgroundColor: const Color.fromARGB(255, 41, 28, 171),
            title: const Text('Buenos días, Maria Peralta!',
                style: TextStyle(fontSize: 25, color: Colors.white)),
            centerTitle: true,
            actions: [
              IconButton(
                padding: const EdgeInsets.all(8.0),
                iconSize: 25,
                alignment: Alignment.topCenter,
                onPressed: () {},
                icon: const Icon(
                  Icons.exit_to_app_rounded,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 90,
                  backgroundColor: const Color.fromARGB(255, 41, 28, 171),
                  child: Image.asset(
                    'assets/logo.png',
                    height: 120,
                    width: 120,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  shrinkWrap: true,
                  children: maquina
                      .map((maquina) => buildCard(maquina, true))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
