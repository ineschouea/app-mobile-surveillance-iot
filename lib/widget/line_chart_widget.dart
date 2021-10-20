import 'package:fl_chart/fl_chart.dart';
import 'package:map/models/sensor.dart';
import 'package:map/widget/line_titles.dart';
import 'package:flutter/material.dart';

import '../constants.dart';


class LineChartWidget extends StatelessWidget {

  const LineChartWidget({Key? key, required this.sensor, required this.dateStart, required this.dateEnd, required this.freq, }) : super(key: key);

  // Declare a field that holds the Todo.
  final Sensor sensor;
  final DateTime dateStart;
  final DateTime dateEnd;
  final String freq;



  @override
  Widget build(BuildContext context) => LineChart(


        LineChartData(
          minX: 0,
          maxX: 12,
          minY: 0,
          maxY: 6,
          titlesData: LineTitles.getTitleData("JAN_FEB_MAR"),
          gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
            drawVerticalLine: true,
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: const Color(0xff37434d), width: 1),
          ),
          lineBarsData: [

            LineChartBarData(


              spots: [
                FlSpot(0, sensor.SensorMeasures[0]/10),
                FlSpot(1, sensor.SensorMeasures[1]/10),
                FlSpot(2, sensor.SensorMeasures[2]/10),
                FlSpot(3, sensor.SensorMeasures[3]/10),
                FlSpot(4, sensor.SensorMeasures[4]/10),
                FlSpot(5, sensor.SensorMeasures[5]/10),
                FlSpot(6, sensor.SensorMeasures[6]/10),
                FlSpot(7, sensor.SensorMeasures[7]/10),
                FlSpot(8, sensor.SensorMeasures[8]/10),
                FlSpot(9, sensor.SensorMeasures[9]/10),
                FlSpot(10, sensor.SensorMeasures[10]/10),
                FlSpot(11, sensor.SensorMeasures[11]/10),
                FlSpot(12, sensor.SensorMeasures[11]/10),




              ],
              isCurved: true,
              colors: [
                kPrimaryColor,
              ],
              barWidth: 5,
              // dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                colors:  [
                  kPrimaryColor,
                ]
                    .map((color) => color.withOpacity(0.3))
                    .toList(),
              ),
            ),
          ],
        ),
      );
}
