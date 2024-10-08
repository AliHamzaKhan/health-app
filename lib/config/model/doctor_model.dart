import 'package:health_app/config/model/rating_model.dart';
import 'package:health_app/config/services/data_parser_service.dart';


List<DoctorModel> doctorModelList(List value) =>
    value.map((json) => DoctorModel.fromJson(json)).toList();


class DoctorModel {
  String id;
  String name;
  String email;
  String degree;
  String age;
  String phoneNo;
  String gender;
  String address;
  List<String> hospitals;
  String specialization;
  String experience;
  String image;
  String availability;
  List<RatingModel> rating;

  DoctorModel({
    required this.id,
    required this.name,
    required this.email,
    required this.degree,
    required this.age,
    required this.phoneNo,
    required this.gender,
    required this.address,
    required this.hospitals,
    required this.specialization,
    required this.experience,
    required this.image,
    required this.availability,
    required this.rating,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: dataParser.getString(json['id']),
      name: dataParser.getString(json['name']),
      email: dataParser.getString(json['email']),
      degree: dataParser.getString(json['degree']),
      age: dataParser.getString(json['age']),
      phoneNo: dataParser.getString(json['phone_no']),
      gender: dataParser.getString(json['gender']),
      address: dataParser.getString(json['address']),
      hospitals: List<String>.from(json['hospitals']),
      specialization: dataParser.getString(json['specialization']),
      experience: dataParser.getString(json['experience']),
      image: dataParser.getString(json['image']),
      availability: dataParser.getString(json['availability']),
      rating: ratingModelList(json['rating']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'degree': degree,
      'age': age,
      'phone_no': phoneNo,
      'gender': gender,
      'address': address,
      'hospitals': hospitals,
      'specialization': specialization,
      'experience': experience,
      'image': image,
      'availability': availability,
      'rating': rating.map((r) => r.toJson()).toList(),
    };
  }
}
