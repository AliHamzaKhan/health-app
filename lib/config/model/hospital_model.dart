import 'package:health_app/config/model/rating_model.dart';
import 'package:health_app/config/services/data_parser_service.dart';

List<HospitalModel> hospitalModelList(List value) =>
    value.map((json) => HospitalModel.fromJson(json)).toList();

class HospitalModel {
  String id;
  String name;
  String address;
  String phoneNumber;
  String email;
  String website;
  String type;
  List<String> departments;
  List<RatingModel> rating;
  String latlng;
  String img;
  int staffCount;

  HospitalModel({
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.email,
    required this.website,
    required this.type,
    required this.departments,
    required this.rating,
    required this.latlng,
    required this.img,
    required this.staffCount,
  });

  factory HospitalModel.fromJson(Map<String, dynamic> json) {
    return HospitalModel(
      id: dataParser.getString(json['id']),
      name: dataParser.getString(json['name']),
      address: dataParser.getString(json['address']),
      phoneNumber: dataParser.getString(json['phone_number']),
      email: dataParser.getString(json['email']),
      website: dataParser.getString(json['website']),
      type: dataParser.getString(json['type']),
      departments: json['departments'] != null
          ? List<String>.from(json['departments'])
          : [],
      rating: ratingModelList(json['rating'] ?? []),
      latlng: dataParser.getString(json['latlng']),
      img: dataParser.getString(json['img']),
      staffCount: dataParser.getInt(json['staff_count']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phone_number': phoneNumber,
      'email': email,
      'website': website,
      'type': type,
      'departments': departments,
      'rating': rating.map((r) => r.toJson()).toList(),
      'latlng': latlng,
      'img': img,
      'staff_count': staffCount,
    };
  }
}
