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
      appBar:
      PreferredSize(preferredSize: const Size.fromHeight(150), 
        child:ClipPath(clipper: CurveAppBar(),
        child: AppBar(
          shadowColor:Colors.grey,
          scrolledUnderElevation: 20.0,
          backgroundColor: const Color.fromARGB(255, 41, 28, 171),
          title: const Text('Buenos días, Maria Peralta!',
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,)), 
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
        )),
       /*AppBar(
        foregroundColor: Colors.black,
        backgroundColor: const Color.fromARGB(235, 34, 3, 207),
        toolbarHeight: 80.0,
        shadowColor: Colors.grey,
        scrolledUnderElevation: 20.0,
        actions: [
          IconButton(
            alignment: Alignment.center,
            onPressed: () {},
            icon: const Icon(
              Icons.exit_to_app_rounded,
              color: Colors.white,
            ),
          ),
        ],
        title: const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Buenos días, Maria Peralta!",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),*/
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                ),
                itemCount: maquina.length,
                itemBuilder: (context, index) {
                  return buildCard(maquina[index]);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.00),
            child: buildNewProcessCard(),
          ),
        ],
      ),
    );
  }

  Card buildCard(String title) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color: Color.fromARGB(235, 34, 3, 207),
          width: 2,
        ),
      ),
      margin: const EdgeInsets.all(15),
      elevation: 10,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings_sharp),
              color: const Color.fromARGB(235, 34, 3, 207),
              iconSize: 70,
            ),
            Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(235, 34, 3, 207),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

   Card buildNewProcessCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color:  Color.fromARGB(235, 34, 3, 207),
          width: 2,
        ),
      ),
      margin: const EdgeInsets.all(20),
      elevation: 8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                /*setState(() {
                  maquina.add('M0' + (maquina.length + 1).toString());
                });*/
              },
              icon: const Icon(
                Icons.add_circle_outline,
                color: Color.fromARGB(235, 34, 3, 207),
                size: 60,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Nuevo Proceso',
                  style: TextStyle(
                    fontSize: 16,
                    color:  Color.fromARGB(235, 34, 3, 207),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}