import 'package:health_app/config/services/data_parser_service.dart';

class SugarModel {
  String id;
  String sugarType;
  String dateTime;
  double totalSugar;

  SugarModel(
      {required this.id,
      required this.sugarType,
      required this.dateTime,
      required this.totalSugar});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'sugarType': sugarType,
      'dateTime': dateTime,
      'totalSugar': totalSugar,
    };
    if(id.trim().isNotEmpty){
      data['id'] = id;
    }
    return data;
  }

  factory SugarModel.fromJson(Map<String, dynamic> json) {
    return SugarModel(
      id: dataParser.getString(json['id']),
      sugarType: dataParser.getString(json['sugarType']),
      dateTime: dataParser.getString(json['dateTime']),
      totalSugar: dataParser.getDouble(json['totalSugar']),
    );
  }

  bool isEmpty() {
    return id.isEmpty ||
        sugarType.isEmpty ||
        dateTime.isEmpty ||
        totalSugar == 0;
  }
}
