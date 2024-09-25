

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_key_contant.dart';
import '../../utils/app_print.dart';
import '../../widget/app_alerts.dart';
import '../../widget/app_loading.dart';
import '../enviroment/app_environment.dart';
import '../storage/data_store_service.dart';
import 'api_response_model.dart';
import 'package:http/http.dart' as http;
import '../auth/auth_service.dart';

typedef CompleteCallback = void Function(dynamic callBack);
typedef SuccessCallback = void Function(dynamic success);
typedef ErrorsCallback = void Function(dynamic error);

class APIService {

  String commonError = "Something went wrong, Please try again later";
  String connectivityError = "No internet connection, Please try again later";
  String validationError = "Please enter valid information to proceed";
  String invalidResponse = "Invalid response from server";
  String serverError = "Invalid response from server";
  String errorMessage = 'Error occurred';

  var kDebugMode = false;

  Future<Map> getWithoutCallBack(
      String url,
      Map<String, String> queryParams, {
        showLoader = true,
        BuildContext? context,
        Function? logout,
      }) async {
    try {
      if (showLoader) {
        AppLoader.showLoading();
      }
      String uri = "${AppEnvironment.apiUrl()}$url${Uri(queryParameters: queryParams)}";

      var response = await http.get(
        Uri.parse(uri),
        headers: _setHeaders(),
      );
      if (response.statusCode == 401 && logout != null) {
        Get.find<AuthService>().logout();
        return {};
      }

      var message = jsonDecode(response.body);
      // printDebug(message);
      if (message != null) {
        return Map.from(message);
      } else {
        if (showLoader) {
          AppLoader.fail(error: commonError);
        }
        return _response();
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      if (showLoader) {
        AppLoader.dismiss();
      }
      return _response();
    }
  }

  /// This is the Api [GET] method. it will give you response in this model [ApiResponseModel].
  Future<ApiResponseModel> get({
    required String endpoint,
    Map<String, String>? params,
    bool disableLoading = false,
    showError = true,
    Function? logout,
  }) async {
    try {
      if (!disableLoading) AppLoader.showLoading();

      String url = "${AppEnvironment.apiUrl()}$endpoint${Uri(queryParameters: params)}";
      appDebugPrint(url);
      http.Response response = await http.get(
        Uri.parse(url),
        headers: _setHeaders(),
      );
      if (!disableLoading) {
        AppLoader.dismiss();
      }
      if ((response.statusCode == 401 || response.statusCode == 403) && logout != null) {
        appDebugPrint(response.statusCode);
        logout();
        Get.find<AuthService>().logoutWithRedirection();

        return ApiResponseModel.fromJson('');
      } else if (response.statusCode == 500) {
        var responseApi = ApiResponseModel.fromJson('');
        responseApi.message = commonError;
        return responseApi;
      }
      appDebugPrint(response.body);
      appDebugPrint(response.body.runtimeType);
      ApiResponseModel message = ApiResponseModel.fromJson(response.body);
      if (!message.isSuccess && showError) {
        appAlerts.customAlert(
          alertTypes: AlertTypes.error,
          title: errorMessage + (kDebugMode ? ' $endpoint' : ''),
          subTitle: message.message  + (kDebugMode ? ' $endpoint' : ''),
        );
      }

      return message;
    } on Exception catch (e) {
      debugPrint(e.toString());
      if (!disableLoading) {
        AppLoader.dismiss();
      }
      if (showError) {
        var isConnectivity = await internetConnectivityCheck();

        appAlerts.customAlert(
          alertTypes:
          !isConnectivity ? AlertTypes.connectivity : AlertTypes.error,
          title: !isConnectivity
              ? connectivityError + (kDebugMode ? ' $endpoint' : '')
              : serverError + (kDebugMode ? ' $endpoint' : ''),
          subTitle: !isConnectivity ? connectivityError : (commonError ),
        );
      }

      ApiResponseModel message = ApiResponseModel.fromMap({});

      return message;
    }
  }

  Future<bool> internetConnectivityCheck() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
    // var connectivityResult = await (Connectivity().checkConnectivity());
    // if (connectivityResult == ConnectivityResult.mobile) {
    //   return true;
    // } else if (connectivityResult == ConnectivityResult.wifi) {
    //   return true;
    // }
    // return false;
  }

  /// This is the Api [POST] method. it will give you response in this model [ApiResponseModel].
  Future<ApiResponseModel> post({
    required String endpoint,
    required Map<String, dynamic> body,
    Map<String, String>? headers,
    bool disableLoading = false,
    bool showError = true,
    Function? logout,
     }) async {
    try {
      if (!disableLoading) AppLoader.showLoading();
      headers ??= {};
      String url = "${AppEnvironment.apiUrl()}$endpoint";

      http.Response response = await http.post(
        Uri.parse(url),
        headers: {...headers, ..._setHeaders()},
        body: jsonEncode(body),
      );

      if (!disableLoading) {
        AppLoader.dismiss();
      }
      if (response.statusCode == 401 && logout != null) {
        logout();
        return ApiResponseModel.fromJson('');
      } else if (response.statusCode == 500) {
        var responseApi = ApiResponseModel.fromJson('');
        responseApi.message = commonError ;
        return responseApi;
      }
      ApiResponseModel message = ApiResponseModel.fromJson(response.body);

      if (!message.isSuccess && showError) {
        appAlerts.customAlert(
            alertTypes: AlertTypes.error,
            title: 'Error${kDebugMode ? ' $endpoint' : ''}',
            subTitle: message.message
        );
      }
      return message;
    } on Exception catch (e) {
      debugPrint(e.toString());
      if (!disableLoading) {
        AppLoader.dismiss();
      }

      if (showError) {
        var isConnectivity = await internetConnectivityCheck();
        appAlerts.customAlert(
          alertTypes:
          !isConnectivity ? AlertTypes.connectivity : AlertTypes.error,
          title: 'Error${kDebugMode ? ' $endpoint' : ''}',
          subTitle: !isConnectivity ? connectivityError : (commonError ),
        );
      }

      ApiResponseModel message = ApiResponseModel.fromMap({});
      return message;
    }
  }

  /// This is the Api [PATCH] method. it will give you response in this model [ApiResponseModel].
  Future<ApiResponseModel> patch({
    required String endpoint,
    required Map<String, dynamic> body,
    Function? logout,
  }) async {
    try {
      AppLoader.showLoading();

      String url = "${AppEnvironment.apiUrl()}$endpoint";
      http.Response response = await http.patch(
        Uri.parse(url),
        headers: _setHeaders(),
        body: jsonEncode(body),
      );
      if (response.statusCode == 401 && logout != null) {
        logout();
        return ApiResponseModel.fromJson('');
      } else if (response.statusCode == 500) {
        var response = ApiResponseModel.fromJson('');
        response.message = commonError;
        return response;
      }
      ApiResponseModel message = ApiResponseModel.fromJson(response.body);
      AppLoader.dismiss();
      if (message.isSuccess) {
        AppLoader.success(message: message.message);
      } else {
        AppLoader.fail(error: message.message);
      }

      return message;
    } on Exception catch (_) {
      AppLoader.dismiss();
      ApiResponseModel message = ApiResponseModel.fromMap({});
      return message;
    }
  }

  /// This is the Api [PUT] method. it will give you response in this model [ApiResponseModel].
  Future<ApiResponseModel> put({
    required String endpoint,
    required Map<String, dynamic> body,
    Function? logout,
  }) async {
    try {
      AppLoader.showLoading();

      String url = "${AppEnvironment.apiUrl()}$endpoint";
      http.Response response = await http.put(
        Uri.parse(url),
        headers: _setHeaders(),
        body: jsonEncode(body),
      );
      if (response.statusCode == 401 && logout != null) {
        logout();
        return ApiResponseModel.fromJson('');
      } else if (response.statusCode == 500) {
        var responce = ApiResponseModel.fromJson('');
        responce.message = commonError;
        return responce;
      }
      ApiResponseModel message = ApiResponseModel.fromJson(response.body);
      AppLoader.dismiss();
      if (message.isSuccess) {
        AppLoader.success(message: message.message, duration: 1);
      } else {
        appAlerts.customAlert(
            alertTypes: AlertTypes.error,
            title: 'Error',
            subTitle: message.message);

      }

      return message;
    } on Exception catch (_) {
      AppLoader.dismiss();
      ApiResponseModel message = ApiResponseModel.fromMap({});
      return message;
    }
  }

  /// This is the Api [DELETE] method. it will give you response in this model [ApiResponseModel].
  Future<ApiResponseModel> delete({
    required String endpoint,
    Map<String, String>? params,
    bool disableLoading = false,
    showError = true,
    Function? logout,
  }) async {
    try {
      if (!disableLoading) AppLoader.showLoading();

      String url = "${AppEnvironment.apiUrl()}$endpoint${Uri(queryParameters: params)}";
      http.Response response = await http.delete(
        Uri.parse(url),
        headers: _setHeaders(),
      );
      if (!disableLoading) {
        AppLoader.dismiss();
      }

      if (response.statusCode == 401 && logout != null) {
        logout();
        return ApiResponseModel.fromJson('');
      } else if (response.statusCode == 500) {
        var response = ApiResponseModel.fromJson('');
        response.message = commonError;
        return response;
      }
      ApiResponseModel message = ApiResponseModel.fromJson(response.body);

      if (!message.isSuccess && showError) {
        appAlerts.customAlert(
            alertTypes: AlertTypes.error,
            title: 'Error',
            subTitle: message.message);
      }

      return message;
    } on Exception catch (e) {
      debugPrint(e.toString());
      if (!disableLoading) {
        AppLoader.dismiss();
      }
      if (showError) {
        var isConnectivity = await internetConnectivityCheck();

        appAlerts.customAlert(
            alertTypes: AlertTypes.error,
            title: 'Error',
            subTitle: !isConnectivity ? connectivityError : commonError);
      }

      ApiResponseModel message = ApiResponseModel.fromMap({});
      return message;
    }
  }

  /*
  * #### Post fine Method
  * @@@@@ params
  * 1 -- BuildContext
  * 2 -- url
  * 3 -- post MAP
  * 4 -- headers MAP
  * 5 -- success Method callback
  * 6 -- fail method callback
  * 7 -- returnFull optional, true for return complete output false for return just data inside success
  * 8 -- loader optional default true, for showing loader while request
  * */

  postFile({
    required String endpoint,
    // required File file,
    Map<String, dynamic>? body,
    required SuccessCallback success,
    required ErrorsCallback requestFail,
    showLoader = true,
  }) async {
    String url = "${AppEnvironment.apiUrl()}$endpoint";
    var request = http.MultipartRequest("POST", Uri.parse(url));
    request.headers.addAll({...request.headers, ..._setHeaders()});
    if (body != null) {
      body.forEach((key, value) {
        request.fields[key] = '$value';
      });
    }

    if (showLoader) {
      AppLoader.showLoading();
    }
    request.send().then((streamedResponse) async {
      if (streamedResponse.statusCode >= 200 &&
          streamedResponse.statusCode < 399) {
        // showLoader && CBLoader.dismiss();
        var response = await http.Response.fromStream(streamedResponse);
        var responseJson = json.decode(response.body);
        if (responseJson != null) {
          success(responseJson);
        } else {
          requestFail(commonError);
        }
      } else {
        requestFail(commonError);
      }
    }).catchError((error) {
      if (showLoader) {
        AppLoader.dismiss();
      }
      requestFail(commonError);
    });
  }

  patchWithoutContext(
      String url,
      Map<String, String> queryParams,
      Map<String, dynamic> body,
      SuccessCallback success,
      ErrorsCallback requestFail, {
        showLoader = true,
        Function? logout,
      }) async {
    String uri = "${AppEnvironment.apiUrl()}$url${Uri(queryParameters: queryParams)}";
    appDebugPrint(uri);
    try {
      if (showLoader) {
        AppLoader.showLoading();
      }
      appDebugPrint(body);
      var response = await http.patch(
        Uri.parse(uri),
        body: jsonEncode(body),
        headers: _setHeaders(),
      );
      var message = jsonDecode(response.body);
      if (message != null) {
        final Map map = Map.from(message);
        success(map);
      } else {
        if (showLoader) {
          AppLoader.fail(error: commonError);
        }
        requestFail(commonError);
      }
    } catch (e) {
      if (showLoader) {
        AppLoader.fail(error: "$e");
      }

      if (true)
      {
        requestFail(e);
      }
    }
  }

  _setHeaders() {
    Map<String, String> authHeader = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Access-Control-Allow-Origin": "*"
    };
    return {...authHeader, ...getAuthToken()};
  }

  Map<String, String> getAuthToken() {
    // String thisUser = dataStore.getString(AppKeyConstant.kUserInfo);

    String thisToken = dataStore.getString(AppKeyConstant.kToken);

    if (/*thisUser != "" && */thisToken != "") {
      // ignore: no_leading_underscores_for_local_identifiers
      // var _userData = dataParser.decodeMap(thisUser);
      // var user = PbUserModel.fromJson(_userData);
      return {
        'Authorization': 'Bearer $thisToken'
        // 'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEsIm5hbWUiOiJhbGkgYWxpIiwidXNlck5hbWUiOiJhbGkiLCJlbWFpbCI6ImFsaUBtYWlsLmNvbSIsInJvbGVJZCI6MSwidXNlclJvbGVJZCI6MSwiaWF0IjoxNjk1ODkxMTg2LCJleHAiOjE2OTU4OTExODZ9.IrudcheaN7pYdni_lZVhucye761rPtd8vdGao3osqqI'
        // ,
        // 'X-Authorization': dataParser.base64Encoder(user.userId!.toString()),
      };
    }else{
      return {};
    }

  }

  _response({isSuccess = false, statusCode = 200, message}) {
    return {
      "isSuccess": isSuccess,
      "statusCode": statusCode,
      "message": message ?? commonError,
    };
  }
}