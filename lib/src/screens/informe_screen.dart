import 'package:app_movil_coffe/src/Widgets/curva_appbar.dart';
import 'package:flutter/material.dart';

// Pantalla principal del informe.
class InformeScreen extends StatefulWidget {
  const InformeScreen({super.key});

  @override
  State<InformeScreen> createState() => _InformeScreenState();
}

class _InformeScreenState extends State<InformeScreen> {
  // Listas para opciones de café y procesos.
  List<String> tipoCafe = ['Opción 1', 'Opción 2', 'Opción 3'];
  List<String> tipoProceso = ['Opción 1', 'Opción 2', 'Opción 3'];
  String? proceso;
  String? cafe;

  // Clave global para el formulario, usada para la validación y manejo del estado del formulario.
  final _formKey = GlobalKey<FormState>();

  // Función para manejar cambios en la selección del tipo de café.
  void onChanged(String? nuevoValor) {
    setState(() {
      cafe = nuevoValor;
    });
  }

  // Función para manejar cambios en la selección del tipo de proceso.
  void onChangedProceso(String? nuevoValor) {
    setState(() {
      proceso = nuevoValor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(195),
        child: ClipPath(
          clipper: CurveAppBar(), // Personalización del AppBar con una curva.
          child: AppBar(
            toolbarHeight: 60,
            shadowColor: Colors.grey,
            scrolledUnderElevation: 20.0,
            backgroundColor: const Color.fromARGB(255, 41, 28, 171),
            title: const Padding(
              padding: EdgeInsets.only(top: 35),
              child: Text(
                'Buenos días, Maria Peralta!',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 24, right: 15),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
                    color: Colors.white,
                  ),
                  child: const Center(
                    child: Text(
                      "1",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(42.0),
          child: Form(
            key: _formKey, // Asocia la clave global al formulario.
            child: Column(
              children: [
                Text(
                  "CREACION DEL PROCESO",
                  style: TextStyle(
                      color: Color.fromARGB(255, 41, 28, 171),
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
                // Campo de texto para ingresar el origen del café.
                const SizedBox(height: 25),

                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Ingrese el tipo de cafe",
                    hintStyle:
                        const TextStyle(fontSize: 14, color: Colors.black54),
                    filled: true,
                    fillColor: const Color.fromARGB(129, 204, 197, 197),
                    labelText: "Origen del café",
                    labelStyle:
                        const TextStyle(fontSize: 14, color: Colors.black54),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 185, 182, 182),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 185, 182, 182),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 185, 182, 182),
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                // Campo desplegable para seleccionar el tipo de café.
                DropdownButtonFormField<String>(
                  icon: const Icon(Icons.arrow_drop_down_circle_sharp),
                  borderRadius: BorderRadius.circular(8),
                  autofocus: false,
                  value: cafe,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 185, 182, 182)),
                  hint: const Text('Seleccione el tipo de café'),
                  items: tipoCafe.map<DropdownMenuItem<String>>((String valor) {
                    return DropdownMenuItem<String>(
                      value: valor,
                      child: Text(
                        valor,
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black54),
                      ),
                    );
                  }).toList(),
                  onChanged:
                      onChanged, // Función que maneja el cambio de valor.
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(129, 204, 197, 197),
                    labelText: 'Tipo de café',
                    labelStyle:
                        const TextStyle(fontSize: 14, color: Colors.black54),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1.0, color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 185, 182, 182),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                // Campo de texto multilínea para ingresar una descripción.
                TextFormField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(129, 204, 197, 197),
                    labelText: "Descripción",
                    labelStyle:
                        const TextStyle(fontSize: 14, color: Colors.black54),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 185, 182, 182),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 185, 182, 182),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 185, 182, 182),
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                // Campo desplegable para seleccionar el tipo de proceso.
                DropdownButtonFormField<String>(
                  icon: const Icon(Icons.arrow_drop_down_circle_sharp),
                  borderRadius: BorderRadius.circular(8),
                  autofocus: false,
                  value: proceso,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 185, 182, 182)),
                  hint: const Text('Seleccione el proceso'),
                  items:
                      tipoProceso.map<DropdownMenuItem<String>>((String valor) {
                    return DropdownMenuItem<String>(
                      value: valor,
                      child: Text(
                        valor,
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black54),
                      ),
                    );
                  }).toList(),
                  onChanged:
                      onChangedProceso, // Función que maneja el cambio de valor.
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(129, 204, 197, 197),
                    labelText: 'Tipo de proceso',
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1.0, color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 185, 182, 182),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 185, 182, 182),
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                // Campo de texto para ingresar el peso del café.
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(129, 204, 197, 197),
                    labelText: "Peso del café (Kg)",
                    labelStyle:
                        const TextStyle(fontSize: 14, color: Colors.black54),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 185, 182, 182),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 185, 182, 182),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 185, 182, 182),
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 90,
                    child: CircleAvatar(
                      radius: 120,
                      backgroundColor: const Color.fromARGB(255, 41, 28, 171),
                      child: Center(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.power_settings_new_rounded,
                            color: Colors.white,
                            size: 48,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
