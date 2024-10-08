


import 'package:health_app/config/services/data_parser_service.dart';


List<RatingModel> ratingModelList(List value) =>
    value.map((json) => RatingModel.fromJson(json)).toList();


class RatingModel {
  String id;
  String userId;
  double rating;
  String comment;

  RatingModel({
    required this.id,
    required this.userId,
    required this.rating,
    required this.comment,
  });

  // fromJson method to create a Rating object from a JSON map
  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      id: dataParser.getString(json['id']),
      userId: dataParser.getString(json['user_id']),
      rating: dataParser.getDouble(json['rating']), // Safely convert num to double
      comment: dataParser.getString(json['comment']),
    );
  }

  // toJson method to convert a Rating object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'rating': rating,
      'comment': comment,
    };
  }
}