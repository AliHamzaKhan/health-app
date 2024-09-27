


import 'package:flutter/material.dart';

final bmiResults = <String, double>{
  "Underweight": 18.4,  // Underweight threshold
  "Normal weight": 24.9, // Normal weight threshold
  "Overweight": 29.9,    // Overweight threshold
  "Obesity": 34.9,       // Obesity threshold (Class I)
  "Severe Obesity": 39.9 // Obesity threshold (Class II)
};

// List of corresponding colors for the BMI categories
final resultsColor = <Color>[
  Colors.blue,        // Underweight
  Colors.green,      // Normal weight
  Colors.orange,     // Overweight
  Colors.red,        // Obesity
  Colors.redAccent   // Severe Obesity
];