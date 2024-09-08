import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/config/services/data_parser_service.dart';

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
      bmi.value =
          weightKg.value / ((heightCm.value / 100) * (heightCm.value / 100));
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
      var parts = value.split('.'); // Splitting by dot for feet and inches
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
    var color = Colors.grey; // Default color
    if (bmi >= 30) {
      color = Colors.red; // Obese
    } else if (bmi >= 25) {
      color = Colors.orange; // Overweight
    } else if (bmi >= 18.5) {
      color = Colors.green; // Normal
    } else {
      color = Colors.blue; // Underweight
    }
    return color;
  }
}
