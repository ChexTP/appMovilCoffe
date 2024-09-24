import 'package:flutter/material.dart';

Card buildCard(String title, String estado) {
  Color colorEstado(String status) {
    switch (status) {
      case 'Activo':
        return Colors.green;
      case 'Inactivo':
        return Colors.grey;
      case 'En Mantenimiento':
        return Colors.orange;
      default:
        return Colors
            .white; // Retorna un color por defecto si el estado no coincide
    }
  }

  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: const BorderSide(
        color: Color.fromARGB(235, 34, 3, 207),
        width: 1,
      ),
    ),
    margin: const EdgeInsets.all(8),
    elevation: 6,
    child: Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.settings_sharp,
                  color: Color.fromARGB(235, 34, 3, 207),
                  size: 60,
                )),
            Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(235, 34, 3, 207),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 78,
          right: 63,
          child: CircleAvatar(
            radius: 13,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: colorEstado(estado),
            ),
          ),
        ),
      ],
    ),
  );
}
