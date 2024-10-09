import 'package:health_app/config/services/data_parser_service.dart';

List<UserProfile> userProfileList(List value) =>
    value.map((json) => UserProfile.fromJson(json)).toList();

class UserProfile {
  String id;
  String firstName;
  String lastName;
  String email;
  String phoneNo;
  String dob;
  String country;
  String city;
  String gender;
  String profileImage;
  bool isVerified;
  int packageId;
  double usage;
  int userTypeId;

  UserProfile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNo,
    required this.dob,
    required this.country,
    required this.city,
    required this.gender,
    required this.profileImage,
    required this.isVerified,
    required this.packageId,
    required this.usage,
    required this.userTypeId,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: dataParser.getString(json['id']),
      firstName: dataParser.getString(json['first_name']),
      lastName: dataParser.getString(json['last_name']),
      email: dataParser.getString(json['email']),
      phoneNo: dataParser.getString(json['phone_no']),
      dob: dataParser.getString(json['dob']),
      country: dataParser.getString(json['country']),
      city: dataParser.getString(json['city']),
      gender: dataParser.getString(json['gender']),
      profileImage: dataParser.getString(json['profile_image']),
      isVerified: dataParser.getBool(json['is_verified']),
      packageId: dataParser.getInt(json['package_id']),
      usage: dataParser.getDouble(json['usage']),
      userTypeId: dataParser.getInt(json['user_type_id']),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone_no': phoneNo,
      'dob': dob,
      'country': country,
      'city': city,
      'gender': gender,
      'profile_image': profileImage,
      'is_verified': isVerified,
      'package_id': packageId,
      'usage': usage,
      'user_type_id': userTypeId,
    };
    if (id.isNotEmpty) {
      data['id'] = id;
    }
    return data;
  }
  bool isProfileEmpty() {
    return firstName.isEmpty ||
        lastName.isEmpty ||
        email.isEmpty ||
        phoneNo.isEmpty ||
        dob.isEmpty ||
        country.isEmpty ||
        city.isEmpty ||
        gender.isEmpty ||
        profileImage.isEmpty ||
        packageId <= 0 || // Assuming packageId should be a positive value
        usage <= 0; // Assuming usage should be greater than zero
  }
}
