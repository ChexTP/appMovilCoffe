import 'dart:async'; // Importa dart:async para Timer
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_movil_coffe/src/Widgets/curva_appbar.dart';
import 'package:app_movil_coffe/src/Widgets/grafica_widget.dart';
import 'package:app_movil_coffe/src/controllers/seguimiento_controller.dart';
import 'package:app_movil_coffe/src/models/maquina_model.dart';
import 'package:app_movil_coffe/src/models/seguimiento_model.dart';
import 'package:app_movil_coffe/src/provider/user_provider.dart';

/// Pantalla principal que muestra el informe de la máquina.
class InformeMaquinaScreen extends StatefulWidget {
  final Maquina maquina;
  const InformeMaquinaScreen({super.key, required this.maquina});

  @override
  State<InformeMaquinaScreen> createState() => _InformeMaquinaScreenState();
}

class _InformeMaquinaScreenState extends State<InformeMaquinaScreen> {
  bool temporizador = false;
  bool inicio = false;
  late Maquina maquina;
  Seguimiento? seguimiento;
  TimeOfDay? _selectedTime;
  Timer? _timer; // Timer para verificar el tiempo

  @override
  void initState() {
    super.initState();
    maquina = widget.maquina;
    _fetchSeguimiento();
    if (temporizador) {
      _startTimer(); // Inicia el temporizador solo si el temporizador está activado
    }
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancela el temporizador al destruir el widget
    super.dispose();
  }

  Future<void> _fetchSeguimiento() async {
    try {
      final seguimientoData =
          await SeguimientoService().getSeguimientoByMaquinaId(maquina.id);
      setState(() {
        seguimiento = seguimientoData;
      });
    } catch (e) {
      print('Error al obtener seguimiento: $e');
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        if (temporizador) {
          _startTimer(); // Reinicia el temporizador si el tiempo seleccionado cambia
        }
      });
    }
  }

  void _startTimer() {
    _timer?.cancel(); // Cancela el temporizador anterior si existe
    _timer = Timer.periodic(const Duration(seconds: 30), (timer) {
      final now = TimeOfDay.now();
      if (_selectedTime != null &&
          now.hour == _selectedTime!.hour &&
          now.minute == _selectedTime!.minute) {
        _showAlert();
        _timer
            ?.cancel(); // Detiene el temporizador después de mostrar la alerta
      }
    });
  }

  void _showAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('¡Alarma!'),
          content: const Text('Se ha cumplido el tiempo programado.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final usuario = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: ClipPath(
          clipper: CurveAppBar(),
          child: AppBar(
            foregroundColor: Colors.white,
            toolbarHeight: 90,
            shadowColor: Colors.grey,
            scrolledUnderElevation: 20.0,
            backgroundColor: const Color.fromARGB(255, 41, 28, 171),
            title: Text(
              usuario!.nombreCompleto,
              style: const TextStyle(fontSize: 35, color: Colors.white),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 1, right: 20),
                child: Container(
                  height: 50,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      maquina.idInterno,
                      style: const TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 41, 28, 171),
                          fontWeight: FontWeight.bold),
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
              Row(
                children: [
                  const Text(
                    'Propietario:',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    seguimiento?.loteCafe.proveedor.nombreCompleto ??
                        'Cargando...',
                    style: const TextStyle(fontSize: 19),
                  )
                ],
              ),
              const SizedBox(height: 25),

              // Información sobre el tipo de café.
              Row(
                children: [
                  const Text(
                    "Tipo café:",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    seguimiento?.loteCafe.variedad.nombre ?? 'Cargando...',
                    style: const TextStyle(fontSize: 19),
                  )
                ],
              ),
              const SizedBox(height: 25),

              // Información sobre el tipo de proceso.
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Tipo Proceso:",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      seguimiento?.loteCafe.tipoProceso.nombre ?? 'Cargando...',
                      softWrap: true,
                      overflow: TextOverflow.visible,
                      style: const TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 25),

              // Información sobre la fecha y hora de inicio del proceso.
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Fecha y hora de inicio de proceso:",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        textAlign: TextAlign.center,
                        seguimiento != null
                            ? '${seguimiento!.fecha.day}/${seguimiento!.fecha.month}/${seguimiento!.fecha.year} ${seguimiento!.fecha.hour}:${seguimiento!.fecha.minute}'
                            : 'Cargando...',
                        style: const TextStyle(
                          fontSize: 19,
                        ),
                      )
                    ],
                  ),
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
                            shape: BoxShape.circle, color: Colors.green),
                        child: const Icon(
                          Icons.air,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Temperatura ambiente",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 18, 182, 23),
                        ),
                        child: Center(
                          child: Text(
                            seguimiento?.datos?.isNotEmpty == true
                                ? seguimiento!.datos!.last.temperaturaAmbiente
                                : '00',
                            // seguimiento?.datos?.last.id,
                            style: const TextStyle(fontSize: 25),
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
                            shape: BoxShape.circle, color: Colors.green),
                        child: const Icon(
                          Icons.settings,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Temperatura interna",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(197, 26, 101, 231),
                        ),
                        child: Center(
                          child: Text(
                            seguimiento?.datos?.isNotEmpty == true
                                ? seguimiento!.datos!.last.temperaturaSensor
                                : '00',
                            style: const TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // Grafica Lineal
              // if (seguimiento != null)
              LinealCharts(datos: seguimiento?.datos),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 10.0,
                        width: 30.0,
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                          color: Colors.blue,
                        )),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Temperatura ambiente',
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 10.0,
                        width: 30.0,
                        child: DecoratedBox(
                            decoration: BoxDecoration(
                          color: Colors.red,
                        )),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Temperatura interna',
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  )
                ],
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
                    activeTrackColor: const Color.fromARGB(255, 229, 227, 248),
                    activeColor: const Color.fromARGB(255, 41, 28, 171),
                    value: temporizador,
                    onChanged: (value) async {
                      setState(() {
                        temporizador = value;
                        if (temporizador) {
                          _startTimer(); // Inicia el temporizador al activar el switch
                        } else {
                          _timer
                              ?.cancel(); // Cancela el temporizador al desactivar el switch
                        }
                      });

                      if (value) {
                        await _selectTime(context);
                      }
                    },
                  ),
                ],
              ),
              if (temporizador && _selectedTime != null)
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[200], // Color de fondo gris claro
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      _selectTime(
                          context); // Abre el selector de tiempo al hacer clic en el Container
                    },
                    child: AbsorbPointer(
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: _selectedTime == null
                              ? 'Seleccione la hora de la alarma'
                              : 'Hora seleccionada: ${_selectedTime!.format(context)}',
                          suffixIcon:
                              const Icon(Icons.access_time), // Ícono de reloj
                        ),
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 10),
              // Botón para iniciar el proceso.
              Center(
                child: SizedBox(
                  width: 70,
                  child: CircleAvatar(
                    radius: 60,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
