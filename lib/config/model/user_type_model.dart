


import 'package:health_app/config/services/data_parser_service.dart';

List<UserTypeModel> userTypeModelList(List value) =>
    value.map((json) => UserTypeModel.fromJson(json)).toList();


class UserTypeModel {
  final int userTypeId;
  final String userTypeName;

  UserTypeModel({
    required this.userTypeId,
    required this.userTypeName,
  });

  // Convert a JSON map to a UserTypeModel instance
  factory UserTypeModel.fromJson(Map<String, dynamic> json) {
    return UserTypeModel(
      userTypeId: dataParser.getInt(json['user_type_id']),
      userTypeName: dataParser.getString(json['user_type_name']),
    );
  }

  // Convert a UserTypeModel instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'user_type_id': userTypeId,
      'user_type_name': userTypeName,
    };
  }
}