import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LinealCharts extends StatelessWidget {
  const LinealCharts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            height: 350.0,
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 1),
                      const FlSpot(1, 3),
                      const FlSpot(2, 5),
                      const FlSpot(4, 6),
                      const FlSpot(7, 1),
                    ],
                    isCurved: true,
                    color: Colors.deepPurple,
                  ),
                  LineChartBarData(
                    spots: [
                      const FlSpot(0, 4),
                      const FlSpot(1, 6),
                      const FlSpot(2, 2),
                      const FlSpot(4, 7),
                      const FlSpot(7, 8),
                    ],
                    isCurved: true,
                    color: Colors.blue,
                  ),
                ],
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    axisNameSize: 40,
                    axisNameWidget: const Text(
                      'Tiempo',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        const style = TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        );
                        String text;
                        switch (value.toInt()) {
                          case 0:
                            text = '1';
                            break;
                          case 1:
                            text = '2';
                            break;
                          case 2:
                            text = '3';
                            break;
                          case 3:
                            text = '4';
                            break;
                          case 4:
                            text = '5';
                            break;
                          case 5:
                            text = '6';
                            break;
                          case 6:
                            text = '7';
                            break;
                          case 7:
                            text = '8';
                            break;
                          default:
                            text = '';
                            break;
                        }
                        return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(text, style: style));
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    axisNameSize: 40,
                    axisNameWidget: const Text(
                      'Temperatura ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 20,
                      getTitlesWidget: (value, meta) {
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(
                    color: const Color(0xff37434d),
                    width: 1,
                  ),
                ),
                gridData: const FlGridData(show: false),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
