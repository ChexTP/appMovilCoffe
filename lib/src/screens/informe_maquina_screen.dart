import 'package:app_movil_coffe/src/Widgets/curva_appbar.dart';
// import 'package:app_movil_coffe/src/Widgets/grafica_lineal.dart';
import 'package:flutter/material.dart';

class InformeMaquinaScreen extends StatefulWidget {
  const InformeMaquinaScreen({super.key});

  @override
  State<InformeMaquinaScreen> createState() => _InformeMaquinaScreenState();
}

class _InformeMaquinaScreenState extends State<InformeMaquinaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(195),
        child: ClipPath(
            clipper: CurveAppBar(),
            child: AppBar(
              toolbarHeight: 60,
              shadowColor: Colors.grey,
              scrolledUnderElevation: 20.0,
              backgroundColor: const Color.fromARGB(255, 41, 28, 171),
              title: const Padding(
                padding: EdgeInsets.only(top: 35),
                child: Text('Buenos días, Maria Peralta!',
                    style: TextStyle(fontSize: 25, color: Colors.white)),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(top: 24, right: 15),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
                        color: Colors.white),
                    child: const Center(
                        child: Text(
                      "1",
                      style: TextStyle(fontSize: 25),
                    )),
                  ),
                )
              ],
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Propietario del cafe:",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
            const Text(
              "Tipo cafe:",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Nombre Proceso:",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Fecha y hora de inicio de proceso:",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 35),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                        child: const Icon(Icons.air,
                            size: 40, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Temperatura relativa",
                        style: TextStyle(fontSize: 15),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 18, 182, 23)),
                        child: const Center(
                          child: Text(
                            "00",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                        child: const Icon(Icons.settings,
                            size: 40, color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Temperatura interna",
                        style: TextStyle(fontSize: 15),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(197, 26, 101, 231)),
                        child: const Center(
                          child: Text(
                            "00",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // const SizedBox(
                      //   height: 300,
                      //   child: GraficaLineal(),
                      // )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
