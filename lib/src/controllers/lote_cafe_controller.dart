import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:app_movil_coffe/src/models/lote_cafe_model.dart'; // Asegúrate de que el modelo está importado correctamente

class LoteCafeService {
  final String baseUrl = "https://proyecto-sena-backend-s666.onrender.com/api";

  Future<List<LoteCafe>> getAllLotesCafe() async {
    try {
      final url = Uri.parse('$baseUrl/loteCafe');
      // print('URL de solicitud: $url');

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('Datos decodificados: $data'); // Imprime los datos decodificados

        if (data is Map<String, dynamic> && data['lotesCafe'] != null) {
          List<LoteCafe> lotesCafe = (data['lotesCafe'] as List)
              .map((loteJson) => LoteCafe.fromJson(loteJson))
              .toList();
          for (var lote in lotesCafe) {
            print('ID: ${lote.id}, Peso: ${lote.peso}, Proveedor: ${lote.proveedor.username}');
          }
          return lotesCafe;
        } else {
          throw Exception('La clave "lotesCafe" no se encuentra en la respuesta.');
        }
      } else {
        throw Exception('Error al obtener los lotes de café. Código de estado: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de red: $e');
    }
  }
}
