import 'package:health_app/config/services/data_parser_service.dart';
import '../enums/ai_request_type_enum.dart';
import 'ai_generated_text.dart';

List<DataProcessModel> dataProcessModelList(List value) =>
    value.map((json) => DataProcessModel.fromJson(json)).toList();

class DataProcessModel {
  String id;
  String userId;
  String prompt;
  String imageUrl;
  int tokenUsed;
  AiGeneratedTextModel aiGeneratedText;
  AiRequestTypeEnum requestType;

  DataProcessModel({
    required this.id,
    required this.userId,
    required this.prompt,
    required this.imageUrl,
    required this.tokenUsed,
    required this.aiGeneratedText,
    required this.requestType,
  });

  factory DataProcessModel.fromJson(Map<String, dynamic> json) {
    return DataProcessModel(
      id: dataParser.getString(json['id']),
      userId: dataParser.getString(json['user_ud']),
      prompt: dataParser.getString(json['prompt']),
      imageUrl: dataParser.getString(json['image_url']),
      tokenUsed: dataParser.getInt(json['token_used']),
      aiGeneratedText: AiGeneratedTextModel.fromJson(json['ai_generated_text'] ?? {}),
      requestType: getAiRequestTypeEnum(json['request_type'] ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'prompt': prompt,
      'imageUrl': imageUrl,
      'tokenUsed': tokenUsed,
      'aiGeneratedText': aiGeneratedText.toJson(),
      'requestType': requestType.value,
    };
  }

  @override
  String toString() {
    return 'DataProcessModel{id: $id, userId: $userId, prompt: $prompt, imageUrl: $imageUrl, tokenUsed: $tokenUsed, aiGeneratedText: $aiGeneratedText, requestType: $requestType}';
  }
}

DataProcessModel tempDataDataProcessModel = DataProcessModel(
    id: 'askj76asd7asda',
    userId: 'asjh8720923adsdfADds',
    prompt: 'this is prompt',
    imageUrl: 'www.google.com',
    aiGeneratedText: AiGeneratedTextModel(
        diagnosis: 'you have low blood level',
        treatment: 'to much blood loss early seek treatment',
        doctorsRecommended: ['Hemothologist', 'General_physician'],
        suggestions: ['eat cheeries', 'spanish', 'pomogrenate']),
    requestType: AiRequestTypeEnum.ecgReport,
    tokenUsed: 686);
