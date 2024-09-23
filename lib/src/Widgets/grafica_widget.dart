import 'package:app_movil_coffe/src/models/datos_model.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LinealCharts extends StatelessWidget {
  final List<Datos>? datos;

  const LinealCharts({super.key, required this.datos});

  @override
  Widget build(BuildContext context) {
    final List<Datos>? ultimosDatos =
        (datos != null && datos!.isNotEmpty)
            ? (datos!.length > 10
                ? datos!.sublist(datos!.length - 10)
                : datos!)
            : [];

    if (ultimosDatos!.isEmpty) {
      return Center(child: Text('No hay datos disponibles'));
    }

    List<FlSpot> spotsAmbiente = ultimosDatos.asMap().entries.map((e) {
      double? temperaturaAmbiente = double.tryParse(e.value.temperaturaAmbiente);
      return FlSpot(e.key.toDouble(), temperaturaAmbiente ?? 0);
    }).toList();

    List<FlSpot> spotsSensor = ultimosDatos.asMap().entries.map((e) {
      double? temperaturaSensor = double.tryParse(e.value.temperaturaSensor);
      return FlSpot(e.key.toDouble(), temperaturaSensor ?? 0);
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 350.0,
        child: LineChart(
          LineChartData(
            titlesData: FlTitlesData(
              show: true,
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 10,
                  getTitlesWidget: (value, meta) {
                    if (value % 10 == 0) {
                      return Text('${value.toInt()}°C',
                          style: TextStyle(color: Colors.black, fontSize: 12));
                    }
                    return Text('');
                  },
                  reservedSize: 40,
                ),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    final index = value.toInt();
                    // Asegúrate de que el índice sea válido
                    if (index >= 0 && index <= ultimosDatos.length) {
                      final fecha = ultimosDatos[index].fecha;
                      return Text(
                        '${fecha.hour}:${fecha.minute.toString().padLeft(2, '0')}',
                      );
                    }
                    return Text('holaaa'); // Para índices no utilizados
                  },
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            minY: 0,
            maxY: 60,
            lineBarsData: [
              LineChartBarData(
                spots: spotsAmbiente,
                isCurved: true,
                color: Colors.blue,
                belowBarData: BarAreaData(show: false),
              ),
              LineChartBarData(
                spots: spotsSensor,
                isCurved: true,
                color: Colors.red,
                belowBarData: BarAreaData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
