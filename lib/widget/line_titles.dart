import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class LineTitles {

  static getTitleData(periode) => FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 35,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff68737d),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          getTitles: (value) {
              switch (value.toInt()) {
                case 0:
                  return periode.substring(0, 3);

                case 4:
                  return periode.substring(4, 7);

                case 8:
                  return periode.substring(8, 11);

                default:
                  return '';
              }
            }
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10°';
              case 3:
                return '30°';
              case 5:
                return '50°';
            }
            return '';
          },
          reservedSize: 35,
          margin: 12,
        ),
      );
}
