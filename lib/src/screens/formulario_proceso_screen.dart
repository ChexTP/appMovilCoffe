import 'package:app_movil_coffe/src/Widgets/curva_appbar.dart';
import 'package:app_movil_coffe/src/controllers/lote_cafe_controller.dart';
import 'package:app_movil_coffe/src/controllers/seguimiento_controller.dart';
import 'package:app_movil_coffe/src/controllers/tipo_cafe_controller.dart';
import 'package:app_movil_coffe/src/controllers/tipo_proceso_controller.dart';
import 'package:app_movil_coffe/src/controllers/usuario_controller.dart';
import 'package:app_movil_coffe/src/models/maquina_model.dart';
import 'package:app_movil_coffe/src/models/tipo_proceso_model.dart';
import 'package:app_movil_coffe/src/models/usuario_model.dart';
import 'package:app_movil_coffe/src/models/variedad.model.dart';
import 'package:app_movil_coffe/src/provider/user_provider.dart';
import 'package:app_movil_coffe/src/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Pantalla principal del informe.
class InformeScreen extends StatefulWidget {
  final Maquina maquina;
  const InformeScreen({super.key, required this.maquina});

  @override
  State<InformeScreen> createState() => _InformeScreenState();
}

class _InformeScreenState extends State<InformeScreen> {
  final LoteCafeService _loteCafeService = LoteCafeService();

  late Maquina maquina;

  // Listas para opciones de café, procesos y origen
  List<String> tipoCafe = ['Opción 1', 'Opción 2', 'Opción 3'];
  List<Map<String, String>> tiposProcesos = [];
  List<Map<String, String>> proveedoresCafe = [];
  List<Map<String, String>> variedadCafe = [];

  String? proceso;
  String? cafe;
  String? proveedorOrigen;
  String? variedad;

  // Clave global para el formulario, usada para la validación y manejo del estado del formulario.
  final _formKey = GlobalKey<FormState>();
  final _pesoCOntroller = TextEditingController();

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

  //funcion para traer los datos de tipo del cafe y ponerlos en una lista
  Future<void> obtenerVariedades() async {
    VariedadesService _variedadesService = VariedadesService();
    try {
      List<Variedad> variedades = await _variedadesService.getAllVariedades();

      setState(() {
        variedadCafe = variedades.map((variedad) {
          return {
            'id': variedad.id, // ID de la variedad
            'nombre': variedad.nombre, // Nombre de la variedad
          };
        }).toList();
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> obtenerProveeder() async {
    UsuarioService _usuarioService = UsuarioService();
    try {
      List<Usuario> proveedores = await _usuarioService.getAllProveedores();

      setState(() {
        // Almacena tanto el id como el nombre
        proveedoresCafe = proveedores.map((proveedor) {
          return {
            'id': proveedor.id, // ID del proveedor
            'nombre': proveedor.nombreCompleto // Nombre del proveedor
          };
        }).toList();
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> obtenerProcesos() async {
    TipoProcesoService _tipoProcesoService = TipoProcesoService();
    try {
      List<TipoProceso> tiposProceso =
          await _tipoProcesoService.getAllTipoProcesos();

      setState(() {
        tiposProcesos = tiposProceso.map((proceso) {
          return {
            'id': proceso.id, // ID del tipo de proceso
            'nombre': proceso.nombre, // Nombre del tipo de proceso
          };
        }).toList();
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    maquina = widget.maquina;
    obtenerVariedades();
    obtenerProveeder();
    obtenerProcesos();
  }

  @override
  Widget build(BuildContext context) {
    final usuario = Provider.of<UserProvider>(context).user;
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
              title: Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Text(
                  usuario!.nombreCompleto,
                  style: const TextStyle(fontSize: 35, color: Colors.white),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(top: 24, right: 15),
                  child: Container(
                    height: 40,
                    width: 60,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
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
                padding: const EdgeInsets.only(
                  top: 35,
                  right: 25,
                  left: 25,
                ),
                child: Form(
                    key: _formKey, // Asocia la clave global al formulario.
                    child: Column(children: [
                      const Text(
                        "CREACION DEL PROCESO",
                        style: TextStyle(
                            color: Color.fromARGB(255, 41, 28, 171),
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 25),
                      // Campo de texto para ingresar el origen del café.
                      DropdownButtonFormField<String>(
                        icon: const Icon(Icons.arrow_drop_down_circle_sharp),
                        borderRadius: BorderRadius.circular(8),
                        autofocus: false,
                        value: proveedorOrigen,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 185, 182, 182),
                          fontSize: 18,
                        ),
                        hint: const Text('Seleccione Proveedor del café'),
                        items: proveedoresCafe.map<DropdownMenuItem<String>>(
                            (Map<String, String> proveedor) {
                          return DropdownMenuItem<String>(
                            value: proveedor['id'], // Usar el ID como valor
                            child: Text(
                              proveedor[
                                  'nombre']!, // Mostrar el nombre en el menú desplegable
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black54),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? nuevoValor) {
                          setState(() {
                            proveedorOrigen =
                                nuevoValor; // Guardar el ID seleccionado
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(129, 204, 197, 197),
                          labelText: 'Proveedor',
                          labelStyle: const TextStyle(
                              fontSize: 20, color: Colors.black54),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1.0, color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 41, 28, 171),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      // campo para seleccionar variedad del café
                      DropdownButtonFormField<Map<String, String>>(
                        icon: const Icon(Icons.arrow_drop_down_circle_sharp),
                        borderRadius: BorderRadius.circular(8),
                        autofocus: false,
                        value: variedad != null
                            ? variedadCafe.firstWhere(
                                (element) => element['id'] == variedad)
                            : null,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 185, 182, 182),
                          fontSize: 18,
                        ),
                        hint: const Text('Seleccione la variedad del café'),
                        items: variedadCafe
                            .map<DropdownMenuItem<Map<String, String>>>(
                                (Map<String, String> variedad) {
                          return DropdownMenuItem<Map<String, String>>(
                            value: variedad,
                            child: Text(
                              variedad['nombre']!,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black54),
                            ),
                          );
                        }).toList(),
                        onChanged: (nuevoValor) {
                          setState(() {
                            variedad = nuevoValor![
                                'id']; // Guarda solo el id de la variedad
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(129, 204, 197, 197),
                          labelText: 'Variedad de café',
                          labelStyle: const TextStyle(
                              fontSize: 20, color: Colors.black54),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1.0, color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 41, 28, 171),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),
                      // Campo desplegable para seleccionar el tipo de proceso a realizar al café
                      DropdownButtonFormField<Map<String, String>>(
                        icon: const Icon(Icons.arrow_drop_down_circle_sharp),
                        borderRadius: BorderRadius.circular(8),
                        autofocus: false,
                        value: proceso != null
                            ? tiposProcesos.firstWhere(
                                (element) => element['id'] == proceso)
                            : null,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 185, 182, 182),
                          fontSize: 18,
                        ),
                        hint: const Text('Seleccione el proceso a realizar'),
                        items: tiposProcesos
                            .map<DropdownMenuItem<Map<String, String>>>(
                                (Map<String, String> tipoProceso) {
                          return DropdownMenuItem<Map<String, String>>(
                            value: tipoProceso,
                            child: Text(
                              tipoProceso['nombre']!,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black54),
                            ),
                          );
                        }).toList(),
                        onChanged: (nuevoValor) {
                          setState(() {
                            proceso = nuevoValor![
                                'id']; // Guarda solo el id del tipo de proceso
                          });
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(129, 204, 197, 197),
                          labelText: 'Proceso del café',
                          labelStyle: const TextStyle(
                              fontSize: 20, color: Colors.black54),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1.0, color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 41, 28, 171),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),
                      // Campo de texto para ingresar el peso del café.
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _pesoCOntroller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(129, 204, 197, 197),
                          labelText: "Peso del café (Kg)",
                          labelStyle: const TextStyle(
                              fontSize: 20, color: Colors.black54),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 41, 28, 171),
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
                            backgroundColor:
                                const Color.fromARGB(255, 41, 28, 171),
                            child: Center(
                              child: IconButton(
                                onPressed: () async {
                                  // Mostrar el modal de confirmación
                                  final bool? confirmar =
                                      await showDialog<bool>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Confirmar'),
                                        content: const Text(
                                            '¿Desea crear el proceso?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(
                                                  false); // Cierra el modal y no confirma
                                            },
                                            child: const Text('No'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(
                                                  true); // Cierra el modal y confirma
                                            },
                                            child: const Text('Sí'),
                                          ),
                                        ],
                                      );
                                    },
                                  );

                                  // Si el usuario confirma la acción, procede a crear el proceso
                                  if (confirmar == true) {
                                    SeguimientoService _seguimientoService =
                                        SeguimientoService();
                                    final peso =
                                        double.parse(_pesoCOntroller.text);
                                    print(proveedorOrigen);
                                    print(proceso);
                                    print(variedad);
                                    print(peso);
                                    print(maquina.estado);

                                    final lote =
                                        await _loteCafeService.createLoteCafe(
                                            proveedorOrigen,
                                            proceso,
                                            variedad,
                                            peso);
                                    print(lote);

                                    final seguimiento =
                                        await _seguimientoService
                                            .crearSeguimiento(
                                                maquina.id, lote!, usuario.id);
                                    print(seguimiento);

                                    // Navegar a HomeScreen si el proceso se crea exitosamente
                                    Navigator.of(context).pushReplacement(
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            const HomeScreen(),
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          const begin = Offset(1.0,
                                              0.0); // Comienza desde la derecha
                                          const end = Offset
                                              .zero; // Termina en la posición actual
                                          const curve = Curves.ease;

                                          var tween = Tween(
                                                  begin: begin, end: end)
                                              .chain(CurveTween(curve: curve));
                                          var offsetAnimation =
                                              animation.drive(tween);

                                          return SlideTransition(
                                            position: offsetAnimation,
                                            child: child,
                                          );
                                        },
                                      ),
                                    );
                                  }
                                },
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
                    ])))));
  }
}
