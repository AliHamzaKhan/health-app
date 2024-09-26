import 'package:health_app/config/services/data_parser_service.dart';
import 'package:health_app/utils/app_print.dart';

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
    Map<String, dynamic> data = {
      // 'id': id,
      'notifyMe': notifyMe ? 1 : 0, // SQLite uses int for boolean
      'medicineName': medicineName,
      'timing': timing.join(', '), // Convert List<String> to a single string
      'description': description,
    };
    if(id.trim().isNotEmpty){
      data['id'] = id;
    }
    return data;
  }

  static MedicineScheduleModel fromJson(Map<String, dynamic> json) {
    appDebugPrint('data : ${dataParser.getString(json['timing'])}');
    return MedicineScheduleModel(
      id: dataParser.getString(json['id']),
      notifyMe: dataParser.getBool(json['notifyMe']),
      medicineName: dataParser.getString(json['medicineName']),
      timing: createList(dataParser.getString(json['timing'])) ,
      description: dataParser.getString(json['description']),
    );
  }
  bool isMedicineEmpty(){
    return
        medicineName.trim().isEmpty ||
        timing.isEmpty ||
        description.trim().isEmpty;
  }
}
createList(String data){
  List<String> list = <String>[];
  var split = data.split(', ');
  for(var a in split){
    list.add(a);
  }
  return list;
}
