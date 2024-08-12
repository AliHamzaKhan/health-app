


import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class OpenAIApi {
  final String apiKey;
  final String endpoint;

  OpenAIApi({required this.apiKey, required this.endpoint});

  getApiKey(){
    final apiKey = dotenv.env['API_KEY']!;
  }

  Future<String> generateResponse(String prompt) async {
    final url = Uri.parse(endpoint);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };
    final body = jsonEncode({
      'model': 'your-custom-model-id', // Replace with your custom GPT model ID
      'messages': [
        {'role': 'user', 'content': prompt}
      ]
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['choices'][0]['message']['content'];
    } else {
      throw Exception('Failed to generate response: ${response.statusCode}');
    }
  }
}