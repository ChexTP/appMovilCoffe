import 'package:app_movil_coffe/src/Widgets/card_build.dart';
import 'package:app_movil_coffe/src/Widgets/curva_appbar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _selecteIndex = 0;
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
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 90,
                backgroundColor: Color.fromARGB(255, 41, 28, 171),
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
            child: Container(
              height: 410,
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                color: Color.fromARGB(24, 146, 136, 136),
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                children: maquina.map((maquina) => buildCard(maquina)).toList(),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _selecteIndex,
        height: 60.0,
        items: const [
          Icon(
            Icons.home_rounded,
            size: 30,
            color: Colors.white,
          ),
          Icon(Icons.phone, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        color: const Color.fromARGB(255, 41, 28, 171),
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 400),
        onTap: (index) {
          // setState(() {
          //   index = _selecteIndex;
          // });
        },
      ),
    );
  }
}
