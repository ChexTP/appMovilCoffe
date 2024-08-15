import 'package:app_movil_coffe/src/models/datos_model.dart';
import 'package:app_movil_coffe/src/models/lote_cafe_model.dart';
import 'package:app_movil_coffe/src/models/maquina_model.dart';
import 'package:app_movil_coffe/src/models/usuario_model.dart';

class Seguimiento {
  final String id;
  final Maquina maquina;
  final DateTime fecha;
  final LoteCafe loteCafe;
  final Usuario operador;
  final List<Datos>? datos;

  Seguimiento({
    required this.id,
    required this.maquina,
    required this.fecha,
    required this.loteCafe,
    required this.operador,
    this.datos,
  });

  // Método para crear una instancia de Seguimiento a partir de un JSON
  factory Seguimiento.fromJson(Map<String, dynamic> json) {
    return Seguimiento(
      id: json['_id'],
      maquina: json['maquina'],
      fecha: DateTime.parse(json['fecha']),
      loteCafe: json['loteCafe'],
      operador: json['operador'],
      datos: List<Datos>.from(json['datos']),
    );
  }

  // Método para convertir una instancia de Seguimiento a JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'maquina': maquina,
      'fecha': fecha.toIso8601String(),
      'loteCafe': loteCafe,
      'operador': operador,
      'datos': datos,
    };
  }
}
