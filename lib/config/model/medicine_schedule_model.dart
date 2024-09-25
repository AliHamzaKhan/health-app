import 'package:health_app/config/services/data_parser_service.dart';

class MedicineScheduleModel {
  String id;
  bool notifyMe;
  String medicineName;
  List<String> timing;
  String description;

  MedicineScheduleModel(
      {required this.id,
      required this.notifyMe,
      required this.medicineName,
      required this.timing,
      required this.description});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'notifyMe': notifyMe ? 1 : 0, // SQLite uses int for boolean
      'medicineName': medicineName,
      'timing': timing.join(','), // Convert List<String> to a single string
      'description': description,
    };
  }

  static MedicineScheduleModel fromJson(Map<String, dynamic> json) {
    return MedicineScheduleModel(
      id: dataParser.getString(json['id']),
      notifyMe: dataParser.getBool(json['notifyMe']),
      medicineName: dataParser.getString(json['medicineName']),
      timing: dataParser.getString(json['timing']).split(','),
      description: dataParser.getString(json['description']),
    );
  }
}
