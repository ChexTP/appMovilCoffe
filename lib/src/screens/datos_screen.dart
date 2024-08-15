import 'package:flutter/material.dart';

class DatosScreen extends StatefulWidget {
  const DatosScreen({super.key});

  @override
  State<DatosScreen> createState() => _DatosScreenState();
}

class _DatosScreenState extends State<DatosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            title: Text('ID de Máquina'),
            subtitle: Text(maquina.idMaquina),
          ),
          ListTile(
            title: Text('Temperatura'),
            subtitle: Text(datos.temperatura '°C'),
          ),
          ListTile(
            title: Text('Temperatura Sensor 1'),
            subtitle: Text(datos.temperaturaS1 '°C'),
          ),
          ListTile(
            title: Text('Temperatura Sensor 2'),
            subtitle: Text(datos.temperaturaS2 '°C'),
          ),
          ListTile(
            title: Text('Temperatura Promedio'),
            subtitle: Text(datos.temperaturaPromedio '°C'),
          ),
          ListTile(
            title: Text('Fecha de Registro'),
            subtitle: Text('${datos.fecha.toLocal()}'.split(' ')[0]),
          ),
        ],
      ),
    );
  }
}