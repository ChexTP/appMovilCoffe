import 'dart:convert';
import 'package:app_movil_coffe/src/models/seguimiento_model.dart';
import 'package:http/http.dart' as http;


class SeguimientoService {
  Future<Seguimiento> getSeguimientoByMaquinaId(String idMaquina) async {

    final String baseUrl = "https://proyecto-sena-backend-s666.onrender.com/api"; 

    try {
      
      final response = await http.get(Uri.parse('$baseUrl/seguimiento/maquina/$idMaquina'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final seguimientoData = jsonData['data']; // Acceder a la clave "data"
        // print(seguimientoData);
        return Seguimiento.fromJson(seguimientoData);
      } else {
        throw Exception('Error al obtener seguimiento por maquina: ${response.statusCode}');
      }
    } catch (e) {
      if (e is http.ClientException) {
        throw Exception('Error de conexión: ${e.message}');
      } else {
        throw Exception('Error desconocido: $e');
      }
    }
  }



Future<String?> crearSeguimiento(
    String maquina, String loteCafe, String operador,) async {
  // URL de tu API
  final String baseUrl = "https://proyecto-sena-backend-s666.onrender.com/api";  // Reemplaza con tu URL

  // Cuerpo de la solicitud
  final Map<String, dynamic> body = {
    'maquina': maquina,
    'loteCafe': loteCafe,
    'operador': operador,
    // Agrega cualquier otro campo necesario aquí
  };

  try {
    // Envía la solicitud POST
    final response = await http.post(Uri.parse('$baseUrl/seguimiento'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    ); 

    if (response.statusCode == 201) {
      final responseData = jsonDecode(response.body);
      final seguimiento = responseData;
      print('Seguimiento creado correctamente');
      // print(seguimiento);
      return seguimiento;
    } else {
      print('Error al crear seguimiento: ${response.body}');
      return null;
    }
  } catch (e) {
    print('Error en la solicitud: $e');
    return null;
  }
}

}
