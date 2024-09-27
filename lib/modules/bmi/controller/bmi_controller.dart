import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/config/services/data_parser_service.dart';

import '../../../config/theme/bmi_values.dart';

class BmiController extends GetxController {
  var weightUnitList = ['kg', 'lbs'].obs;
  var heightUnitList = ['cm', 'ft/in'];
  var weightKg = 0.0.obs;
  var weightLbs = 0.0.obs;
  var heightCm = 0.0.obs;
  var heightFeet = 0.0.obs;
  var heightInches = 0.0.obs;
  var bmi = 0.0.obs;

  var weightUnit = 'kg'.obs; // Default to kg
  var heightUnit = 'cm'.obs; // Default to cm

  void calculateBMI() {
    if (heightCm > 0) {
      bmi.value = weightKg.value / ((heightCm.value / 100) * (heightCm.value / 100));
    } else {
      bmi.value = 0.0;
    }
  }

  void updateWeight(String unit, double value) {
    if (unit == 'kg') {
      weightKg.value = value;
      weightLbs.value = value * 2.20462;
    } else if (unit == 'lbs') {
      weightLbs.value = value;
      weightKg.value = value / 2.20462;
    }
  }

  void updateHeight(String unit, String value) {
    if (unit == 'cm') {
      var cm = dataParser.getDouble(value);
      if (cm != 0.0) {
        heightCm.value = cm;
        heightFeet.value = cm / 30.48;
        heightInches.value = (cm / 2.54) % 12;
      }
    } else if (unit == 'ft/in') {
      var parts = value.split(RegExp(r'[.,\/\\;! ]+')); // Splitting by dot for feet and inches
      if (parts.length == 2) {
        var feet = dataParser.getDouble(parts[0]);
        var inches = dataParser.getDouble(parts[1]);
        if (feet != 0.0 && inches != 0.0) {
          heightFeet.value = feet;
          heightInches.value = inches;
          heightCm.value = (feet * 30.48) + (inches * 2.54);
        }
      }
    }
  }
  Color getBMIcolor(){
    // var color = Colors.grey; // Default color
    Color color = resultsColor[4]; // Severe Obesity

    if (bmi.value >= 30) {
      color = resultsColor[3]; // Obesity
    } else if (bmi.value >= 25) {
      color = resultsColor[2]; // Overweight
    } else if (bmi.value >= 18.5) {
      color = resultsColor[1]; // Normal weight
    } else {
      color = resultsColor[0]; // Underweight
    }
    return color;
  }
}

