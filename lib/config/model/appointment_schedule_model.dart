


import 'package:health_app/config/services/data_parser_service.dart';

class AppointmentScheduleModel{
  String id;
  String doctorName;
  String hospitalName;
  String date;
  String description;
  String address;
  bool notifyMe;

  AppointmentScheduleModel({
    required this.id,
    required this.doctorName,
    required this.hospitalName,
    required this.date,
    required this.description,
    required this.address,
    required this.notifyMe,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doctorName': doctorName,
      'hospitalName': hospitalName,
      'date': date,
      'description': description,
      'address': address,
      'notifyMe': notifyMe ? 1 : 0, // SQLite doesn't support boolean directly
    };
  }

  // Create an object from JSON (Map<String, dynamic>)
  static AppointmentScheduleModel fromJson(Map<String, dynamic> json) {
    return AppointmentScheduleModel(
      id: dataParser.getString(json['id']),
      doctorName: dataParser.getString(json['doctorName']),
      hospitalName: dataParser.getString(json['hospitalName']),
      date: dataParser.getString(json['date']),
      description: dataParser.getString(json['description']),
      address: dataParser.getString(json['address']),
      notifyMe: dataParser.getBool(json['notifyMe']),
    );
  }
}