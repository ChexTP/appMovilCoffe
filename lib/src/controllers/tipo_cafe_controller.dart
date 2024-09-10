import 'dart:convert';
import 'package:app_movil_coffe/src/models/variedad.model.dart';
import 'package:http/http.dart' as http;


class VariedadesService {
  final String baseUrl = "https://proyecto-sena-backend-s666.onrender.com/api"; // Reemplaza <TU_IP> con la dirección IP de tu servidor

  Future<List<Variedad>> getAllVariedades() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/variedad'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<Variedad> variedades = (data['variedades'] as List)
            .map((variedadesJson) => Variedad.fromJson(variedadesJson))
            .toList();
        // for (var variedad in variedades) {
        //   print('ID: ${variedad.id}, Nombre: ${variedad.nombre}');
        // }
        return variedades;
      } else {
        throw Exception('Error al obtener los tipos de variedades de cafe');
      }
      
    } catch (e) {
      throw Exception('Error de red: $e');
    }
  }
}