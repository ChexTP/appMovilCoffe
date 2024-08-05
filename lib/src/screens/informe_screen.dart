import 'package:app_movil_coffe/src/Widgets/curva_appbar.dart';
import 'package:flutter/material.dart';

class InformeScreen extends StatefulWidget {
  const InformeScreen({super.key});

  @override
  State<InformeScreen> createState() => _InformeScreenState();
}

class _InformeScreenState extends State<InformeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(150), 
      child: 
        ClipPath(clipper: CurveAppBar(),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color.fromARGB(255, 41, 28, 171),Color.fromARGB(255, 0, 0, 116)])
          ),
        ),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'PROPIETARIO CAFE:',
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 24),
                ),
                const SizedBox(height: 18),
                const Text('TIPO CAFE:',
                style: TextStyle(fontSize: 24)),
                const SizedBox(height: 18),
                const Text('NOMBRE PROCESO:',
                style: TextStyle(fontSize: 24)),
                const SizedBox(height: 18),
                const Text('Fecha y hora de inicio de proceso:',
                style: TextStyle(fontSize: 24)),
                const SizedBox(height: 18),
                const Text(
                  'dd/mm/aaaa/ ##:## am',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildIcon(Icons.air, 'TEMPERATURA RELATIVA'),
                    _buildIcon(Icons.settings, 'TEMPERATURA INTERNA'),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildTemperature(00, Colors.green),
                    _buildTemperature(00, Colors.lightBlue),
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}

  Widget _buildIcon(IconData icon, String text) {
    return Column(
      children: [
        Icon(
          icon,
          size: 48,
          color: Colors.grey,
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildTemperature(int temperature, Color color) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Text(
        '$temperature',
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }