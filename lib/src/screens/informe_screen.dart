import 'package:app_movil_coffe/src/Widgets/curva_appbar.dart';
import 'package:flutter/material.dart';

class InformeScreen extends StatefulWidget {
  const InformeScreen({super.key});

  @override
  State<InformeScreen> createState() => _InformeScreenState();
}

class _InformeScreenState extends State<InformeScreen> {
  List<String> tipoCafe = ['Opción 1', 'Opción 2', 'Opción 3'];
  String? item;
  bool _isPressed = false;


  final _formKey = GlobalKey<FormState>();

  void onChanged(String? nuevoValor) {
    setState(() {
      item = nuevoValor;
    });
  }

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(129, 204, 197, 197),
                    labelText: "Origin del cafe",
                    labelStyle:
                        const TextStyle(fontSize: 14, color: Colors.black54),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 185, 182, 182),
                            width: 1.0),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 185, 182, 182),
                            width: 1.0),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 185, 182, 182),
                            width: 1.0))),
              ),
              const SizedBox(height: 25),
                 DropdownButtonFormField<String>(
                  icon: const Icon(Icons.arrow_drop_down_circle_sharp),
                  borderRadius: BorderRadius.circular(40),
                  autofocus: false,
                  value: item,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 185, 182, 182)),
                  hint: const Text('Selecciona el tipo de café'),
                  items: tipoCafe.map<DropdownMenuItem<String>>((String valor) {
                    return DropdownMenuItem<String>(
                      alignment: Alignment.center,
                      value: valor,
                      child: Text(valor,style: const TextStyle(fontSize: 14, color: Colors.black54),),
                    );
                  }).toList(),
                  onChanged: onChanged, // Función que maneja el cambio de valor
                  decoration: InputDecoration(
                      labelText: 'Tipo Café',
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1.0),
                          borderRadius: BorderRadius.circular(10))),
                ),
              const SizedBox(height: 25),
              TextFormField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(129, 204, 197, 197),
                    labelText: "Descripcion",
                    labelStyle:
                        const TextStyle(fontSize: 14, color: Colors.black54),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 185, 182, 182),
                            width: 1.0),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 185, 182, 182),
                            width: 1.0),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 185, 182, 182),
                            width: 1.0))),
              ),
              const SizedBox(height: 25),
                 DropdownButtonFormField<String>(
                  icon: const Icon(Icons.arrow_drop_down_circle_sharp),
                  borderRadius: BorderRadius.circular(40),
                  autofocus: false,
                  value: item,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 185, 182, 182)),
                  hint: const Text('Selecione el proceso'),
                  items: tipoCafe.map<DropdownMenuItem<String>>((String valor) {
                    return DropdownMenuItem<String>(
                      value: valor,
                      child: Text(valor,style: const TextStyle(fontSize: 14, color: Colors.black54),),
                    );
                  }).toList(),
                  onChanged: onChanged, // Función que maneja el cambio de valor
                  decoration: InputDecoration(
                      labelText: 'Tipo de proceso',
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 1.0),
                          borderRadius: BorderRadius.circular(10))),
                ),
              const SizedBox(height: 25),
              TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(129, 204, 197, 197),
                    labelText: "Peso del cafe (Kg)",
                    labelStyle:
                        const TextStyle(fontSize: 14, color: Colors.black54),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 185, 182, 182),
                            width: 1.0),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 185, 182, 182),
                            width: 1.0),
                        borderRadius: BorderRadius.circular(10)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 185, 182, 182),
                            width: 1.0))),
              ),
              const SizedBox(height: 16.0),
              const Padding(
                padding: EdgeInsets.only(top: 15,bottom: 15),
                child: Center(child: Text('Seleccione la temperatura de trabajo de la secador')),
              ),
              Center(
                child: SizedBox(
                  width: 50,
                  child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(129, 204, 197, 197),
                        labelText: "00°",
                        labelStyle:
                            const TextStyle(fontSize: 14, color: Colors.black54),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 185, 182, 182),
                                width: 1.0),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 185, 182, 182),
                                width: 1.0),
                            borderRadius: BorderRadius.circular(10)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 185, 182, 182),
                                width: 1.0))),
                  ),
                ),
              ),
              SizedBox(
                width: 50,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: _isPressed ?
                  const Color.fromARGB(255, 21, 255, 0):
                   const Color.fromARGB(255, 255, 0,0),
                  child: Center(
                    child: IconButton(onPressed: (){
                      setState(() {
                        _isPressed = !_isPressed;
                      });
                    }, 
                      icon: const Icon(Icons.power_settings_new_rounded,color: Colors.white,)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}