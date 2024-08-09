import 'package:app_movil_coffe/src/Widgets/curva_appbar.dart';
import 'package:flutter/material.dart';

class InformeScreen extends StatefulWidget {
  const InformeScreen({super.key});

  @override
  State<InformeScreen> createState() => _InformeScreenState();
}

class _InformeScreenState extends State<InformeScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: ClipPath(
            clipper: CurveAppBar(),
            child: AppBar(
              toolbarHeight: 60,
              shadowColor: Colors.grey,
              scrolledUnderElevation: 20.0,
              backgroundColor: const Color.fromARGB(255, 41, 28, 171),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
                        color: Colors.white),
                    child: const Center(
                        child: Text(
                      "1",
                      style: TextStyle(fontSize: 24),
                    )),
                  ),
                )
              ],
            )),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextFormField(
            decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(129, 204, 197, 197),
                labelText: "Origin del cafe",
                labelStyle: TextStyle(fontSize: 14, color: Colors.black54),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 185, 182, 182), width: 1.0),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 185, 182, 182), width: 1.0),
                    borderRadius: BorderRadius.circular(10)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 185, 182, 182),
                        width: 1.0))),
          ),
        ),
      ),
    );
  }
}
