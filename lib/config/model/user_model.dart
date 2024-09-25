import 'package:health_app/config/services/data_parser_service.dart';

class UserModel {
  String id;
  String firstName;
  String lastName;
  String email;
  String phoneNo;
  String dob;
  String country;
  String gender;
  String profileImage;
  bool isVerified;
  int packageId;
  double usage;
  int userTypeId;

  // Constructor
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNo,
    required this.dob,
    required this.country,
    required this.gender,
    required this.profileImage,
    required this.isVerified,
    required this.packageId,
    required this.usage,
    required this.userTypeId,
  });

  // fromJson: Create a UserModel from JSON data
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: dataParser.getString(json['id']),
      firstName: dataParser.getString(json['firstName']),
      lastName: dataParser.getString(json['lastName']),
      email: dataParser.getString(json['email']),
      phoneNo: dataParser.getString(json['phoneNo']),
      dob: dataParser.getString(json['dob']),
      country: dataParser.getString(json['country']),
      gender: dataParser.getString(json['gender']),
      profileImage: dataParser.getString(json['profileImage']),
      isVerified: dataParser.getBool(json['isVerified']),
      packageId: dataParser.getInt(json['packageId']),
      usage: dataParser.getDouble(json['usage']),
      userTypeId: dataParser.getInt(json['userTypeId']),
    );
  }

  // toJson: Convert a UserModel into JSON data
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNo': phoneNo,
      'dob': dob,
      'country': country,
      'gender': gender,
      'profileImage': profileImage,
      'isVerified': isVerified,
      'packageId': packageId,
      'usage': usage,
      'userTypeId': userTypeId,
    };
  }
}
