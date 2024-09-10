import 'package:app_movil_coffe/src/models/storage_model.dart';

class Usuario {
  final String id; 
  final String username;
  final String cedula;
  final String nombreCompleto;
  final String telefono;
  final String direccion;
  final String email;
  final bool estado;
  final Storage? foto; // Cambiamos a un objeto Storage
  final String tipoUsuario;

  Usuario({
    required this.id,
    required this.username,
    required this.cedula,
    required this.nombreCompleto,
    required this.telefono,
    required this.direccion,
    required this.email,
    required this.estado,
    this.foto, // El campo foto ahora es opcional y es un objeto Storage
    required this.tipoUsuario,
  });

  // Método para crear un objeto Usuario a partir de un JSON
  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['_id'],
      username: json['username'],
      cedula: json['cedula'],
      nombreCompleto: json['nombreCompleto'],
      telefono: json['telefono'],
      direccion: json['direccion'],
      email: json['email'],
      estado: json['estado'],
      foto: json['foto'] != null ? Storage.fromJson(json['foto']) : null, // Aquí se maneja el mapeo del objeto 'foto'
      tipoUsuario: json['tipoUsuario'],
    );
  }
}
