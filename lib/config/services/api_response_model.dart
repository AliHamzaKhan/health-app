import 'dart:convert';
import '../../utils/app_print.dart';
import 'data_parser_service.dart';

class ApiResponseModel {
  int? status;
  String token;
  dynamic data;
  bool isSuccess;
  String message;
  String error;

  ApiResponseModel(
      {this.isSuccess = true,
      this.status,
      required this.token,
      required this.data,
      this.message = '',
      this.error = ''});

  ApiResponseModel copyWith({
    String? expires,
    String? status,
    String? token,
    String? error,
    dynamic data,
  }) {
    return ApiResponseModel(
        status: this.status, token: this.token, data: this.data, error: this.error);
  }

  Map<String, dynamic> toMap() {
    return {
      'Error' : error,
      'status': status,
      'token': token,
      'data': data,
    };
  }

  factory ApiResponseModel.fromMap(map) {
    if (map is Map) {
      appDebugPrint('isMap');
      appDebugPrint('isMap ${dataParser.getString(map['Message'])}');
      return ApiResponseModel(
        status: dataParser.getInt(map['status']),
        token: dataParser.getString(map['token']),
        // message: dataParser.getString(map['Message']),
        error: dataParser.getString(map['Message']),
        data: dataParser.getMap(map),
      );
    } else if (map is List) {
      appDebugPrint('isList');
      return ApiResponseModel(
        status: 0,
        token: "",
        data: dataParser.getDynamicList(map),
      );
    } else {
      return ApiResponseModel(
        status: 0,
        token: "",
        data: map,
      );
    }
  }

  String toJson() => json.encode(toMap());

  factory ApiResponseModel.fromJson(String source) {
    var data = json.decode(source);

    return ApiResponseModel.fromMap(data);
  }

  @override
  String toString() {
    return 'ApiResponseModel{ status: $status, token: $token, data: $data}';
  }
}
