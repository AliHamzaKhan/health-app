


import 'package:health_app/config/services/data_parser_service.dart';

List<TokenUsedModel> tokenUsedModelList(List value) =>
    value.map((json) => TokenUsedModel.fromJson(json)).toList();


class TokenUsedModel {
  String id;
  String dataProcessId;
  String userId;
  int tokenUsed;
  String createdAt;

  TokenUsedModel({
    required this.id,
    required this.dataProcessId,
    required this.userId,
    required this.tokenUsed,
    required this.createdAt,
  });

  factory TokenUsedModel.fromJson(Map<String, dynamic> json) {
    return TokenUsedModel(
      id: dataParser.getString(json['id']),
      dataProcessId: dataParser.getString(json['data_process_id']),
      userId: dataParser.getString(json['user_id']),
      tokenUsed: dataParser.getInt(json['token_used']),
      createdAt: dataParser.getString(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'data_process_id': dataProcessId,
      'user_id': userId,
      'token_used': tokenUsed,
      'created_at': createdAt,
    };
  }
}