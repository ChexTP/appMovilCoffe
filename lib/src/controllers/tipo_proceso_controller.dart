import 'dart:convert';
import 'package:app_movil_coffe/src/models/tipo_proceso_model.dart';
import 'package:http/http.dart' as http;


class TipoProcesoService {
  final String baseUrl = "https://proyecto-sena-backend-s666.onrender.com/api"; // Reemplaza <TU_IP> con la dirección IP de tu servidor

  Future<List<TipoProceso>> getAllTipoProcesos() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/tipoProceso'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<TipoProceso> tipoProcesos = (data['tiposProcesos'] as List)
            .map((tipoProcesoJson) => TipoProceso.fromJson(tipoProcesoJson))
            .toList();
        // for (var tipoProceso in tipoProcesos) {
        //   print('ID: ${tipoProceso.id}, Nombre: ${tipoProceso.nombre}');
        // }
        return tipoProcesos;
      } else {
        throw Exception('Error al obtener los tipos de procesos');
      }
      
    } catch (e) {
      throw Exception('Error de red: $e');
    }
  }
}