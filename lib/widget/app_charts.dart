import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../config/theme/bmi_values.dart';

class BMIChart extends StatelessWidget {
  BMIChart({super.key,required this.bmi});
  String bmi;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: bmiResults,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 40,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      colorList: resultsColor,
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 32,
      centerText: bmi,
      legendOptions: LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: true,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: false,
        showChartValuesOutside: true,
        decimalPlaces: 0,
      ),
    );
  }
}
