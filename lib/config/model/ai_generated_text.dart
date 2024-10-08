import 'package:health_app/config/services/data_parser_service.dart';

class AiGeneratedTextModel {
  String diagnosis;
  String treatment;
  List<String> doctorsRecommended;
  List<String> suggestions;

  AiGeneratedTextModel({
    required this.diagnosis,
    required this.treatment,
    required this.doctorsRecommended,
    required this.suggestions,
  });

  factory AiGeneratedTextModel.fromJson(Map<String, dynamic> json) {
    return AiGeneratedTextModel(
      diagnosis: dataParser.getString(json['diagnosis']),
      treatment: dataParser.getString(json['treatment']),
      doctorsRecommended: List<String>.from(json['doctors_recommended'] ?? <String>[]),
      suggestions: List<String>.from(json['suggestions'] ?? <String>[]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'diagnosis': diagnosis,
      'treatment': treatment,
      'doctors_recommended': doctorsRecommended,
      'suggestions': suggestions,
    };
  }
}
