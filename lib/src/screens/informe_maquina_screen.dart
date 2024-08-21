import 'package:app_movil_coffe/src/Widgets/curva_appbar.dart';
import 'package:app_movil_coffe/src/Widgets/grafica_widget.dart';
import 'package:app_movil_coffe/src/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Pantalla principal que muestra el informe de la máquina.
class InformeMaquinaScreen extends StatefulWidget {
  const InformeMaquinaScreen({super.key});

  @override
  State<InformeMaquinaScreen> createState() => _InformeMaquinaScreenState();
}

class _InformeMaquinaScreenState extends State<InformeMaquinaScreen> {
  // Variable que controla el estado del interruptor (temporizador).
  bool temporizador = false;
  // Variable que controla el estado del interruptor (inicio).
  bool inicio = false;

  @override
  Widget build(BuildContext context) {
    final usuario = Provider.of<UserProvider>(context).user;
    return Scaffold(
        // AppBar personalizado con una curva en la parte inferior.
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(195),
          child: ClipPath(
            clipper: CurveAppBar(), // Clip para la curva del AppBar.
            child: AppBar(
              toolbarHeight: 60,
              shadowColor: Colors.grey,
              scrolledUnderElevation: 20.0,
              backgroundColor: const Color.fromARGB(255, 41, 28, 171),
              title: const Text(
                'Buenos días, Maria Peralta!',
                // usuario!.nombreCompleto,
                style: TextStyle(fontSize: 25, color: Colors.white),
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Información sobre el propietario del café.
                    const Row(
                      children: [
                        Text(
                          "Propietario del café:",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Nombre del propietario",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    const SizedBox(height: 25),

                    // Información sobre el tipo de café.
                    const Row(
                      children: [
                        Text(
                          "Tipo café:",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Nombre del tipo de café",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    const SizedBox(height: 25),

                    // Información sobre el tipo de proceso.
                    const Row(
                      children: [
                        Text(
                          "Tipo Proceso:",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Nombre del tipo del proceso",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    const SizedBox(height: 25),

                    // Información sobre la fecha y hora de inicio del proceso.
                    const Row(
                      children: [
                        Text(
                          "Fecha y hora de inicio de proceso:",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "dd/mm/aa",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    ),
                    const SizedBox(height: 35),

                    // Dos columnas que muestran la temperatura relativa y la temperatura interna.
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Columna para la temperatura relativa.
                        Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                              child: const Icon(
                                Icons.air,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Temperatura relativa",
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 60,
                              width: 60,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 18, 182, 23),
                              ),
                              child: const Center(
                                child: Text(
                                  "00",
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Columna para la temperatura interna.
                        Column(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                              child: const Icon(
                                Icons.settings,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Temperatura interna",
                              style: TextStyle(fontSize: 15),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              height: 60,
                              width: 60,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(197, 26, 101, 231),
                              ),
                              child: const Center(
                                child: Text(
                                  "00",
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    //Grafica Lineal
                    const Column(children: [LinealCharts()]),
                    // Información sobre la humedad final del café.
                    const SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Humedad final del café",
                            style: TextStyle(fontSize: 14),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Text("00,00"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),

                    // Texto que indica finalizar el proceso.
                    const Center(
                      child: Text(
                        'Finalizar proceso',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 25),

                    // Switch para activar/desactivar el temporizador.
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Temporizador',
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(width: 10),
                        Switch(
                          inactiveThumbColor: Colors.grey,
                          activeTrackColor:
                              const Color.fromARGB(255, 229, 227, 248),
                          activeColor: const Color.fromARGB(255, 41, 28, 171),
                          value: temporizador,
                          onChanged: (value) {
                            setState(() {
                              temporizador = value;
                            });
                          },
                        ),
                      ],
                    ),
                    // Si el temporizador está activado, muestra el campo de texto para ingresar datos.
                    if (temporizador)
                      Center(
                        child: SizedBox(
                          height: 50,
                          width: 80,
                          child: TextFormField(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 185, 182, 182),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelText: '00.00',
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(129, 204, 197, 197),
                                labelStyle: const TextStyle(
                                    fontSize: 14, color: Colors.black54),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 185, 182, 182),
                                        width: 1.0),
                                    borderRadius: BorderRadius.circular(10)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 185, 182, 182),
                                        width: 1.0))),
                          ),
                        ),
                      ),
                    const SizedBox(height: 25),
                    // Botón de encendido/apagado.
                    Center(
                      child: Container(
                        height: 50,
                        width: 50,
                        // Usamos el operador ternario para cambiar el color basado en el valor de `inicio`
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: inicio ? Colors.green : Colors.red,
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              // Mostrar el modal cuando el botón es presionado
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Confirmación'),
                                    content: const Text(
                                        '¿Estás seguro de que deseas iniciar el proceso?'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // Cerrar el modal
                                        },
                                        child: const Text('Cancelar'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            inicio =
                                                !inicio; // Alternar el valor de `inicio`
                                          });
                                          Navigator.of(context)
                                              .pop(); // Cerrar el modal
                                        },
                                        child: const Text('Confirmar'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.power_settings_new,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    )
                  ])),
        ));
  }
}
