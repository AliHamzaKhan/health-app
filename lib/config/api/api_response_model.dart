import 'dart:convert';
import '../../utils/app_print.dart';
import '../services/data_parser_service.dart';

// class ApiResponseModel {
//   int? status;
//   String token;
//   dynamic data;
//   bool isSuccess;
//   String message;
//   String error;
//
//   ApiResponseModel(
//       {this.isSuccess = true,
//       this.status,
//       required this.token,
//       required this.data,
//       this.message = '',
//       this.error = ''});
//
//   ApiResponseModel copyWith({
//     String? expires,
//     String? status,
//     String? token,
//     String? error,
//     dynamic data,
//   }) {
//     return ApiResponseModel(
//         status: this.status, token: this.token, data: this.data, error: this.error);
//   }
//
//   Map<String, dynamic> toMap() {
//     return {
//       'Error' : error,
//       'status': status,
//       'token': token,
//       'data': data,
//     };
//   }
//
//
//   factory ApiResponseModel.fromMap(map) {
//     if (map is Map) {
//       appDebugPrint('isMap');
//       appDebugPrint('isMap ${dataParser.getString(map['message'])}');
//       return ApiResponseModel(
//         status: dataParser.getInt(map['status']),
//         token: dataParser.getString(map['token']),
//         // message: dataParser.getString(map['Message']),
//         error: dataParser.getString(map['message']),
//         data: dataParser.getMap(map),
//       );
//     } else if (map is List) {
//       appDebugPrint('isList');
//       return ApiResponseModel(
//         status: 0,
//         token: "",
//         data: dataParser.getDynamicList(map),
//       );
//     } else {
//       return ApiResponseModel(
//         status: 0,
//         token: "",
//         data: map,
//       );
//     }
//   }
//
//   String toJson() => json.encode(toMap());
//
//   factory ApiResponseModel.fromJson(String source) {
//     var data = json.decode(source);
//
//     return ApiResponseModel.fromMap(data);
//   }
//
//   @override
//   String toString() {
//     return 'ApiResponseModel{ status: $status, token: $token, data: $data}';
//   }
// }

class ApiResponseModel {
  bool isSuccess;
  dynamic data;
  String message;

  ApiResponseModel({
    this.isSuccess = true,
    required this.data,
    this.message = 'Successful',
  });

  ApiResponseModel copyWith({
    bool? isSuccess,
    dynamic data,
    String? message,
  }) {
    return ApiResponseModel(
      isSuccess: isSuccess ?? this.isSuccess,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'success': isSuccess,
      'data': data,
      'message': message,
    };
  }

  factory ApiResponseModel.fromMap(Map<String, dynamic> map) {
    return ApiResponseModel(
      isSuccess: dataParser.getBool(map['success']),
      data: dataParser.getMap(map['data']),
      message: dataParser.getString(map['message']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiResponseModel.fromJson(String source) {
    var data = json.decode(source);
    return ApiResponseModel.fromMap(data);
  }

  @override
  String toString() {
    return 'ApiResponseModel{ isSuccess: $isSuccess, data: $data, message: $message }';
  }
}
