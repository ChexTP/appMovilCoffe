// Importamos el controlador
// import 'package:app_movil_coffe/src/controllers/tipo_cafe_controller.dart';
import 'package:app_movil_coffe/src/controllers/lote_cafe_controller.dart';
import 'package:app_movil_coffe/src/controllers/usuario_controller.dart';
// import 'package:app_movil_coffe/src/controllers/tipo_proceso_controller.dart';
import 'package:flutter/material.dart';

class DatosScreen extends StatefulWidget {
  @override
  _DatosScreenState createState() => _DatosScreenState();
}

class _DatosScreenState extends State<DatosScreen> {
  // final TipoProcesoService _tipoProcesoService = TipoProcesoService(); // Instancia del controlador
  // final VariedadesService _variedadesService = VariedadesService();
// final UsuarioService _usuarioService = UsuarioService();
  final LoteCafeService _loteCafeService = LoteCafeService();

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  // Llamamos al controlador para obtener los datos
  void _fetchData() {
    // _tipoProcesoService.getAllTipoProcesos(); // Llama a la función fetchMaquinas() del servicio
    // _variedadesService.getAllVariedades();
    // _usuarioService.getAllProveedores();
    _loteCafeService.getAllLotesCafe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla de Datos'),
      ),
      body: Center(
        child: Text(
          'Revisa la consola para ver los datos de la API',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
