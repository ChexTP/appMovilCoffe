import 'dart:convert';
import 'package:app_movil_coffe/src/models/usuario_model.dart';
import 'package:http/http.dart' as http;
 // Importa el modelo Storage
 // Importa el modelo Usuario

class UsuarioService {
  final String baseUrl = "https://proyecto-sena-backend-s666.onrender.com/api";

  Future<List<Usuario>> getAllProveedores() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/usuarios'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<Usuario> usuarios = (data['users'] as List)
            .map((userJson) => Usuario.fromJson(userJson))
            .toList();

        // Filtra los usuarios por 'tipoUsuario' igual a 'Proveedor'
        List<Usuario> proveedores = usuarios.where((usuario) => usuario.tipoUsuario == 'Proveedor').toList();

        if (proveedores.isEmpty) {
          print('No hay proveedores disponibles.');
        } else {
          // Imprime los detalles de los proveedores
          for (var proveedor in proveedores) {
            print('ID: ${proveedor.id}, Nombre Completo: ${proveedor.nombreCompleto}, Foto URL: ${proveedor.foto?.url}');
          }
        }

        return proveedores;
      } else {
        throw Exception('Error al obtener los usuarios');
      }
    } catch (e) {
      throw Exception('Error de red: $e');
    }
  }
}
