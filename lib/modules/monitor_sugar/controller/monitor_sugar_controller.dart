import 'package:get/get.dart';

class MonitorSugarController extends GetxController {
  List<Map<GlucoseType, double>> sugarList = [
    {GlucoseType.fasting: 90.0},
    {GlucoseType.random: 150.0},
    {GlucoseType.fasting: 100.0},
    {GlucoseType.random: 160.0},
  ];

  double calculateEstimatedHbA1c(List<Map<GlucoseType, double>> sugarList) {
    double totalFasting = 0.0;
    double totalRandom = 0.0;
    int fastingCount = 0;
    int randomCount = 0;

    for (var sugar in sugarList) {
      if (sugar.containsKey(GlucoseType.fasting)) {
        totalFasting += sugar[GlucoseType.fasting]!;
        fastingCount++;
      } else if (sugar.containsKey(GlucoseType.random)) {
        totalRandom += sugar[GlucoseType.random]!;
        randomCount++;
      }
    }

    double averageFasting =
        fastingCount > 0 ? totalFasting / fastingCount : 0.0;
    double averageRandom = randomCount > 0 ? totalRandom / randomCount : 0.0;

    // Convert average glucose levels to estimated HbA1c
    double estimatedHbA1cFasting =
        (averageFasting + 46.7) / 28.7; // For fasting glucose
    double estimatedHbA1cRandom =
        (averageRandom + 46.7) / 28.7; // For random glucose

    // You can choose to return either of the estimates or both. Here we return the average.
    return (estimatedHbA1cFasting + estimatedHbA1cRandom) / 2;
  }

  GlucoseInsight generateGlucoseInsights(List<Map<GlucoseType, double>> sugarList) {
    double totalFasting = 0;
    double totalRandom = 0;
    int fastingCount = 0;
    int randomCount = 0;

    for (var sugar in sugarList) {
      if (sugar.containsKey(GlucoseType.fasting)) {
        totalFasting += sugar[GlucoseType.fasting]!;
        fastingCount++;
      }
      if (sugar.containsKey(GlucoseType.random)) {
        totalRandom += sugar[GlucoseType.random]!;
        randomCount++;
      }
    }

    double averageFasting = fastingCount > 0 ? totalFasting / fastingCount : 0;
    double averageRandom = randomCount > 0 ? totalRandom / randomCount : 0;

    String insight;
    if (averageFasting < 100 && averageRandom < 140) {
      insight = "Your sugar levels are within a healthy range.";
    } else if (averageFasting < 126 || averageRandom < 200) {
      insight =
          "Your sugar levels are slightly elevated. Consider monitoring closely.";
    } else {
      insight =
      "Your sugar levels are high. It's advisable to consult with a healthcare provider.";
    }

    return GlucoseInsight(
      averageFasting: averageFasting,
      averageRandom: averageRandom,
      insight: insight,
    );
  }
}

enum GlucoseType {
  fasting,
  random,
}

class GlucoseInsight {
  final double averageFasting;
  final double averageRandom;
  final String insight;

  GlucoseInsight({
    required this.averageFasting,
    required this.averageRandom,
    required this.insight,
  });
}
