import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pa3_test/main.dart';


LineChartData graph1() {
  List<Color> colors = [const Color(0xff49B7Eb)];
  List<FlSpot> spotsGr1 = <FlSpot>[];
  int ymax = 0;
  int ymin = 100000000000;
  for(int i = 0; i<7; i++){
    int tmp = dateTotalList[6-i];
    if(ymin > tmp) ymin = tmp;
    if(ymax < tmp) ymax = tmp;
    spotsGr1.add(FlSpot(i.toDouble(), (tmp/1000000000)));
  }
  ymin = ymin ~/ 1000000000;
  ymax = (ymax ~/ 1000000000) + 1;


  return LineChartData(
    gridData: FlGridData(
        show: true,
        drawVerticalLine: false,

    ),
    titlesData: FlTitlesData(
      show: true,
      leftTitles: SideTitles(
        getTitles: (val){
          if(val == ymin.toDouble()) return "${ymin.toStringAsFixed(1)}B";
          if(val == ymax.toDouble()) return "${ymax.toStringAsFixed(1)}B";
          return "${val.toInt().toStringAsFixed(1)}B";
        },
        showTitles: true,
        textStyle: const TextStyle(
          color: Color(0xff000000),
          fontWeight: FontWeight.normal,
          fontSize: 11,
        ),
        reservedSize: 36,
        margin: 8,
      ),
      bottomTitles: SideTitles(
        showTitles: true,
        textStyle: const TextStyle(
            color: Color(0xff000000),
            fontWeight: FontWeight.normal,
            fontSize: 11),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return dateList[6].substring(5);
            case 1:
              return dateList[5].substring(5);
            case 2:
              return dateList[4].substring(5);
            case 3:
              return dateList[3].substring(5);
            case 4:
              return dateList[2].substring(5);
            case 5:
              return dateList[1].substring(5);
            case 6:
              return dateList[0].substring(5);
          }
          return '';
        },
        reservedSize: 36,
        margin: 5,
      ),
    ),
    borderData: FlBorderData(
      show: true,
        border: Border.all(width: 0)),
      minX: 0,
      maxX: 6,
      minY: ymin.toDouble(),
      maxY: ymax.toDouble() + 0.25,
    lineBarsData: [
      LineChartBarData(
        spots: spotsGr1,
        isCurved: false,
        barWidth: 3,
        belowBarData: BarAreaData(show: false),
        dotData: FlDotData(
          show: true,
            getDotPainter: (spot, p, data, i){
              return FlDotCirclePainter(
                  radius: 4,
                  color: Color(0xff49B7Eb)
              );
            }
        ),
        colors: colors,
      ),
    ],
  );
}

LineChartData graph2() {
  List<Color> colors = [const Color(0xff49B7Eb)];
  List<FlSpot> spotsGr2 = <FlSpot>[];

  int ymax = 0;
  int ymin = 100000000000;
  for(int i = 0; i<7; i++){
    int tmp = dateDailyList[6-i];
    if(ymin > tmp) ymin = tmp;
    if(ymax < tmp) ymax = tmp;
    spotsGr2.add(FlSpot(i.toDouble(), (tmp/1000000)));
  }
  ymin = ymin ~/ 1000000;
  ymax = (ymax ~/ 1000000) + 10;

  /*
  for(int i = 0; i<7; i++){
    spotsGr2.add(FlSpot(i.toDouble(), (dateDailyList[6-i]/1000000 - 85)/5));
  }
*/
  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: false,
    ),
    titlesData: FlTitlesData(
      show: true,
      leftTitles: SideTitles(
        showTitles: true,
        textStyle: const TextStyle(
          color: Color(0xff000000),
          fontWeight: FontWeight.normal,
          fontSize: 11,
        ),
        getTitles: (val){
          if(val % 10 == 0) return "${val.toInt().toStringAsFixed(1)}M";
          return "";
        },
        reservedSize: 36,
        margin: 8,
      ),
      bottomTitles: SideTitles(
        showTitles: true,
        textStyle: const TextStyle(
            color: Color(0xff000000),
            fontWeight: FontWeight.normal,
            fontSize: 11),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return dateList[6].substring(5);
            case 1:
              return dateList[5].substring(5);
            case 2:
              return dateList[4].substring(5);
            case 3:
              return dateList[3].substring(5);
            case 4:
              return dateList[2].substring(5);
            case 5:
              return dateList[1].substring(5);
            case 6:
              return dateList[0].substring(5);
          }
          return '';
        },
        reservedSize: 36,
        margin: 5,
      ),
    ),
    borderData: FlBorderData(
        show: true,
        border: Border.all(width: 0)),
    minX: 0,
    maxX: 6,
    minY: (ymin - ymin % 10).toDouble(),
    maxY: (ymax - ymax % 10).toDouble() + 2,
    lineBarsData: [
      LineChartBarData(
        spots: spotsGr2,
        isCurved: false,
        barWidth: 3,
        belowBarData: BarAreaData(show: false),
        dotData: FlDotData(
          show: true,
            getDotPainter: (spot, p, data, i){
              return FlDotCirclePainter(
                  radius: 4,
                  color: Color(0xff49B7Eb)
              );
            }
        ),
        colors: colors,
      ),
    ],
  );
}

LineChartData graph3() {
  List<Color> colors = [const Color(0xff49B7Eb)];
  List<FlSpot> spotsGr3 = <FlSpot>[];

  int ymax = 0;
  int ymin = 100000000000;
  for(int i = 0; i<29; i++){
    int tmp = dateTotalList[28-i];
    if(ymin > tmp) ymin = tmp;
    if(ymax < tmp) ymax = tmp;
    spotsGr3.add(FlSpot(i.toDouble(), (tmp/1000000000)));
  }
  ymin = ymin ~/ 1000000000;
  ymax = (ymax ~/ 1000000000) + 1;

  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: false,
    ),
    titlesData: FlTitlesData(
      show: true,
      leftTitles: SideTitles(
        showTitles: true,
        textStyle: const TextStyle(
          color: Color(0xff000000),
          fontWeight: FontWeight.normal,
          fontSize: 11,
        ),
        getTitles: (val){
          if(val == ymin.toDouble()) return "${ymin.toStringAsFixed(1)}B";
          if(val == ymax.toDouble()) return "${ymax.toStringAsFixed(1)}B";
          return "${val.toInt().toStringAsFixed(1)}B";
        },
        reservedSize: 36,
        margin: 8,
      ),
      bottomTitles: SideTitles(
        showTitles: true,
        textStyle: const TextStyle(
            color: Color(0xff000000),
            fontWeight: FontWeight.normal,
            fontSize: 11),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return dateList[28].substring(5);
            case 7:
              return dateList[21].substring(5);
            case 14:
              return dateList[14].substring(5);
            case 21:
              return dateList[7].substring(5);
            case 28:
              return dateList[0].substring(5);
          }
          return '';
        },
        reservedSize: 36,
        margin: 5,
      ),
    ),
    borderData: FlBorderData(
        show: true,
        border: Border.all(width: 0)),
    minX: 0,
    maxX: 28,
    minY: ymin.toDouble(),
    maxY: ymax.toDouble() + 0.25,
    lineBarsData: [
      LineChartBarData(
        spots: spotsGr3,
        isCurved: false,
        barWidth: 3,
        belowBarData: BarAreaData(show: false),
        dotData: FlDotData(
          show: true,
          getDotPainter: (spot, p, data, i){
            return FlDotCirclePainter(
              radius: 2,
              color: Color(0xff49B7Eb)
            );
          }
        ),
        colors: colors,
      ),
    ],
  );
}

LineChartData graph4() {
  List<Color> colors = [const Color(0xff49B7Eb)];
  List<FlSpot> spotsGr4 = <FlSpot>[];

  int ymax = 0;
  int ymin = 100000000000;
  for(int i = 0; i<29; i++){
    int tmp = dateDailyList[28-i];
    if(ymin > tmp) ymin = tmp;
    if(ymax < tmp) ymax = tmp;
    spotsGr4.add(FlSpot(i.toDouble(), (tmp/1000000)));
  }
  ymin = ymin ~/ 1000000;
  ymax = (ymax ~/ 1000000) + 10;

  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: false,
    ),
    titlesData: FlTitlesData(
      show: true,
      leftTitles: SideTitles(
        showTitles: true,
        textStyle: const TextStyle(
          color: Color(0xff000000),
          fontWeight: FontWeight.normal,
          fontSize: 11,
        ),
        getTitles: (val){
          if(val % 10 == 0) return "${val.toInt().toStringAsFixed(1)}M";
          return "";
        },
        reservedSize: 36,
        margin: 8,
      ),
      bottomTitles: SideTitles(
        showTitles: true,
        textStyle: const TextStyle(
            color: Color(0xff000000),
            fontWeight: FontWeight.normal,
            fontSize: 11),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return dateList[28].substring(5);
            case 7:
              return dateList[21].substring(5);
            case 14:
              return dateList[14].substring(5);
            case 21:
              return dateList[7].substring(5);
            case 28:
              return dateList[0].substring(5);
          }
          return '';
        },
        reservedSize: 36,
        margin: 5,
      ),
    ),
    borderData: FlBorderData(
        show: true,
        border: Border.all(width: 0)),
    minX: 0,
    maxX: 28,
    minY: (ymin - ymin % 10).toDouble(),
    maxY: (ymax - ymax % 10).toDouble() + 4,
    lineBarsData: [
      LineChartBarData(
        spots: spotsGr4,
        isCurved: false,
        barWidth: 3,
        belowBarData: BarAreaData(show: false),
        dotData: FlDotData(
          show: true,
            getDotPainter: (spot, p, data, i){
              return FlDotCirclePainter(
                  radius: 2,
                  color: Color(0xff49B7Eb)
              );
            }
        ),
        colors: colors,
      ),
    ],
  );
}

LineChartData graph5() {
  List<Color> colors = [const Color(0xff49B7Eb)];
  List<FlSpot> spotsGr1 = <FlSpot>[];

  int ymax = 0;
  int ymin = 100000000000;
  for(int i = 0; i<7; i++){
    int tmp = dateTotalCaseList[6-i];
    if(ymin > tmp) ymin = tmp;
    if(ymax < tmp) ymax = tmp;
    spotsGr1.add(FlSpot(i.toDouble(), (tmp/1000000)));
  }
  ymin = ymin ~/ 1000000;
  ymax = (ymax ~/ 1000000) + 10;

  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: false,
    ),
    titlesData: FlTitlesData(
      show: true,
      leftTitles: SideTitles(
        showTitles: true,
        textStyle: const TextStyle(
          color: Color(0xff000000),
          fontWeight: FontWeight.normal,
          fontSize: 11,
        ),
        getTitles: (val){
          if(val % 10 == 0) return "${val.toInt().toStringAsFixed(1)}M";
          return "";
        },
        reservedSize: 36,
        margin: 8,
      ),
      bottomTitles: SideTitles(
        showTitles: true,
        textStyle: const TextStyle(
            color: Color(0xff000000),
            fontWeight: FontWeight.normal,
            fontSize: 11),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return dateCaseList[6].substring(5);
            case 1:
              return dateCaseList[5].substring(5);
            case 2:
              return dateCaseList[4].substring(5);
            case 3:
              return dateCaseList[3].substring(5);
            case 4:
              return dateCaseList[2].substring(5);
            case 5:
              return dateCaseList[1].substring(5);
            case 6:
              return dateCaseList[0].substring(5);
          }
          return '';
        },
        reservedSize: 36,
        margin: 5,
      ),
    ),
    borderData: FlBorderData(
        show: true,
        border: Border.all(width: 0)),
    minX: 0,
    maxX: 6,
    minY: (ymin - ymin % 10).toDouble(),
    maxY: (ymax - ymax % 10).toDouble() + 2,
    lineBarsData: [
      LineChartBarData(
        spots: spotsGr1,
        isCurved: false,
        barWidth: 3,
        belowBarData: BarAreaData(show: false),
        dotData: FlDotData(
            show: true,
            getDotPainter: (spot, p, data, i){
              return FlDotCirclePainter(
                  radius: 4,
                  color: Color(0xff49B7Eb)
              );
            }
        ),
        colors: colors,
      ),
    ],
  );
}

LineChartData graph6() {
  List<Color> colors = [const Color(0xff49B7Eb)];
  List<FlSpot> spotsGr2 = <FlSpot>[];

  int ymax = 0;
  int ymin = 100000000000;
  for(int i = 0; i<7; i++){
    int tmp = dateNewCaseList[6-i];
    if(ymin > tmp) ymin = tmp;
    if(ymax < tmp) ymax = tmp;
    spotsGr2.add(FlSpot(i.toDouble(), (tmp/1000000)));
  }
  ymin = ymin ~/ 1000000;
  ymax = (ymax ~/ 1000000) + 1;

  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: false,
    ),
    titlesData: FlTitlesData(
      show: true,
      leftTitles: SideTitles(
        showTitles: true,
        textStyle: const TextStyle(
          color: Color(0xff000000),
          fontWeight: FontWeight.normal,
          fontSize: 11,
        ),
        getTitles: (val){
          if(val == ymin.toDouble()) return "${ymin.toStringAsFixed(1)}M";
          if(val == ymax.toDouble()) return "${ymax.toStringAsFixed(1)}M";
          return "${val.toInt().toStringAsFixed(1)}M";
        },
        reservedSize: 36,
        margin: 8,
      ),
      bottomTitles: SideTitles(
        showTitles: true,
        textStyle: const TextStyle(
            color: Color(0xff000000),
            fontWeight: FontWeight.normal,
            fontSize: 11),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return dateCaseList[6].substring(5);
            case 1:
              return dateCaseList[5].substring(5);
            case 2:
              return dateCaseList[4].substring(5);
            case 3:
              return dateCaseList[3].substring(5);
            case 4:
              return dateCaseList[2].substring(5);
            case 5:
              return dateCaseList[1].substring(5);
            case 6:
              return dateCaseList[0].substring(5);
          }
          return '';
        },
        reservedSize: 36,
        margin: 5,
      ),
    ),
    borderData: FlBorderData(
        show: true,
        border: Border.all(width: 0)),
    minX: 0,
    maxX: 6,
    minY: ymin.toDouble(),
    maxY: ymax.toDouble() + 0.25,
    lineBarsData: [
      LineChartBarData(
        spots: spotsGr2,
        isCurved: false,
        barWidth: 3,
        belowBarData: BarAreaData(show: false),
        dotData: FlDotData(
            show: true,
            getDotPainter: (spot, p, data, i){
              return FlDotCirclePainter(
                  radius: 4,
                  color: Color(0xff49B7Eb)
              );
            }
        ),
        colors: colors,
      ),
    ],
  );
}

LineChartData graph7() {
  List<Color> colors = [const Color(0xff49B7Eb)];
  List<FlSpot> spotsGr3 = <FlSpot>[];

  int ymax = 0;
  int ymin = 100000000000;
  for(int i = 0; i<29; i++){
    int tmp = dateTotalCaseList[28-i];
    if(ymin > tmp) ymin = tmp;
    if(ymax < tmp) ymax = tmp;
    spotsGr3.add(FlSpot(i.toDouble(), (tmp/1000000)));
  }
  ymin = ymin ~/ 1000000;
  ymax = (ymax ~/ 1000000) + 10;

  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: false,
    ),
    titlesData: FlTitlesData(
      show: true,
      leftTitles: SideTitles(
        showTitles: true,
        textStyle: const TextStyle(
          color: Color(0xff000000),
          fontWeight: FontWeight.normal,
          fontSize: 11,
        ),
        getTitles: (val){
          if(val % 10 == 0) return "${val.toInt().toStringAsFixed(1)}M";
          return "";
        },
        reservedSize: 36,
        margin: 8,
      ),
      bottomTitles: SideTitles(
        showTitles: true,
        textStyle: const TextStyle(
            color: Color(0xff000000),
            fontWeight: FontWeight.normal,
            fontSize: 11),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return dateCaseList[28].substring(5);
            case 7:
              return dateCaseList[21].substring(5);
            case 14:
              return dateCaseList[14].substring(5);
            case 21:
              return dateCaseList[7].substring(5);
            case 28:
              return dateCaseList[0].substring(5);
          }
          return '';
        },
        reservedSize: 36,
        margin: 5,
      ),
    ),
    borderData: FlBorderData(
        show: true,
        border: Border.all(width: 0)),
    minX: 0,
    maxX: 28,
    minY: (ymin - ymin%10).toDouble(),
    maxY: (ymax - ymax%10).toDouble() + 5,
    lineBarsData: [
      LineChartBarData(
        spots: spotsGr3,
        isCurved: false,
        barWidth: 3,
        belowBarData: BarAreaData(show: false),
        dotData: FlDotData(
            show: true,
            getDotPainter: (spot, p, data, i){
              return FlDotCirclePainter(
                  radius: 2,
                  color: Color(0xff49B7Eb)
              );
            }
        ),
        colors: colors,
      ),
    ],
  );
}

LineChartData graph8() {
  List<Color> colors = [const Color(0xff49B7Eb)];
  List<FlSpot> spotsGr4 = <FlSpot>[];

  int ymax = 0;
  int ymin = 100000000000;
  for(int i = 0; i<29; i++){
    int tmp = dateNewCaseList[28-i];
    if(ymin > tmp) ymin = tmp;
    if(ymax < tmp) ymax = tmp;
    spotsGr4.add(FlSpot(i.toDouble(), (tmp/1000000)));
  }
  ymin = ymin ~/ 1000000;
  ymax = (ymax ~/ 1000000) + 1;

  return LineChartData(
    gridData: FlGridData(
      show: true,
      drawVerticalLine: false,
    ),
    titlesData: FlTitlesData(
      show: true,
      leftTitles: SideTitles(
        showTitles: true,
        textStyle: const TextStyle(
          color: Color(0xff000000),
          fontWeight: FontWeight.normal,
          fontSize: 11,
        ),
        getTitles: (val){
          if(val == ymin.toDouble()) return "${ymin.toStringAsFixed(1)}M";
          if(val == ymax.toDouble()) return "${ymax.toStringAsFixed(1)}M";
          return "${val.toInt().toStringAsFixed(1)}M";
        },
        reservedSize: 36,
        margin: 8,
      ),
      bottomTitles: SideTitles(
        showTitles: true,
        textStyle: const TextStyle(
            color: Color(0xff000000),
            fontWeight: FontWeight.normal,
            fontSize: 11),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return dateCaseList[28].substring(5);
            case 7:
              return dateCaseList[21].substring(5);
            case 14:
              return dateCaseList[14].substring(5);
            case 21:
              return dateCaseList[7].substring(5);
            case 28:
              return dateCaseList[0].substring(5);
          }
          return '';
        },
        reservedSize: 36,
        margin: 5,
      ),
    ),
    borderData: FlBorderData(
        show: true,
        border: Border.all(width: 0)),
    minX: 0,
    maxX: 28,
    minY: ymin.toDouble(),
    maxY: ymax.toDouble() + 0.25,
    lineBarsData: [
      LineChartBarData(
        spots: spotsGr4,
        isCurved: false,
        barWidth: 3,
        belowBarData: BarAreaData(show: false),
        dotData: FlDotData(
            show: true,
            getDotPainter: (spot, p, data, i){
              return FlDotCirclePainter(
                  radius: 2,
                  color: Color(0xff49B7Eb)
              );
            }
        ),
        colors: colors,
      ),
    ],
  );
}
