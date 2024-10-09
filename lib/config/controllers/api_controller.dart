import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:health_app/config/api/api_response_model.dart';
import 'package:health_app/config/enums/ai_request_type_enum.dart';
import 'package:health_app/config/model/package_model.dart';
import 'package:health_app/constant/url_endpoint.dart';
import 'package:health_app/utils/app_print.dart';
import '../api/api_service.dart';
import '../auth/auth_service.dart';
import '../model/data_process_model.dart';
import '../model/doctor_model.dart';
import '../model/hospital_model.dart';
import '../model/rating_model.dart';
import '../model/token_used_model.dart';
import '../model/user_profile_model.dart';
import '../model/user_type_model.dart';

class ApiController extends GetxService {
  APIService apiService = APIService();
  AuthService authService = Get.find();

  Future login(
      {required int userTypeId,
      required String email,
      required String phoneNo}) async {
    ApiResponseModel response = await apiService.post(
        endpoint: UrlEndPoints.login,
        body: {
          "user_type_id": 2,
          "phone_number": "8327487234",
          "email": "string"
        });
    appDebugPrint(response.data);
  }

  Future saveProfile(
      {required UserProfile profile, required Function(bool) callBack}) async {
    ApiResponseModel response = await apiService.post(
        endpoint: UrlEndPoints.setProfile, body: profile.toJson());
    callBack(response.isSuccess);
  }

  Future<UserProfile> getProfile() async {
    UserProfile profile = UserProfile.fromJson({});
    String userId = authService.saveData.getId();
    ApiResponseModel response =
        await apiService.get(endpoint: UrlEndPoints.getProfile + userId);
    if (response.isSuccess) {
      profile = UserProfile.fromJson(response.data['profile'] ?? {});
    }
    return profile;
  }

  Future<DataProcessModel> processData(
      {required File image, required AiRequestTypeEnum requestType}) async {
    DataProcessModel dataProcess = DataProcessModel.fromJson({});
    String userId = authService.saveData.getId();
    // String base64Image = base64Encode(image.readAsBytesSync());
    ApiResponseModel response = await apiService.postFile(
      endpoint: UrlEndPoints.processData,
      body: {
        'userId': userId.isNotEmpty ? userId : '12132',
        'ai_request_type': requestType.value,
      },
      filePath: [image.path],
    );
    if (response.isSuccess) {
      dataProcess =
          DataProcessModel.fromJson(response.data['data_process'] ?? {});
    }
    appDebugPrint('dataProcess ${dataProcess.toString()}');
    // appDebugPrint('success $success');

    return dataProcess;
  }

  Future<List<DataProcessModel>> getProcessData(
      {AiRequestTypeEnum? requestType}) async {
    List<DataProcessModel> dataProcess = [];
    String userId = authService.saveData.getId();
    Map<String, dynamic> data = {'userId': '121221'};
    if (requestType != null && requestType != AiRequestTypeEnum.none) {
      data['ai_request_type'] = requestType.value;
    }
    ApiResponseModel response = await apiService.post(
        endpoint: UrlEndPoints.getProcessData, body: data);
    if (response.isSuccess) {
      dataProcess = dataProcessModelList(response.data['process_data'] ?? []);
    }
    return dataProcess;
  }

  Future<List<TokenUsedModel>> getUsedTokens({String? dataProcessId}) async {
    List<TokenUsedModel> tokenUsed = [];
    String userId = authService.saveData.getId();
    Map<String, dynamic> data = {
      'user_id': userId.isEmpty ? '12132' : userId,
      // "data_process_id": "string"
    };
    if (dataProcessId != null) {
      data['data_process_id'] = dataProcessId;
    }
    appDebugPrint(data);
    ApiResponseModel response =
        await apiService.post(endpoint: UrlEndPoints.getTokensUsed, body: data);
    if (response.isSuccess) {
      tokenUsed = tokenUsedModelList(response.data['tokens'] ?? []);
    }
    return tokenUsed;
  }

  Future<List<HospitalModel>> getHospitals() async {
    List<HospitalModel> hospitals = [];
    String userId = authService.saveData.getId();
    Map<String, dynamic> data = {'userId': userId};
    ApiResponseModel response =
        await apiService.post(endpoint: UrlEndPoints.getHospitals, body: data);
    if (response.isSuccess) {
      hospitals = hospitalModelList(response.data['hospitals'] ?? []);
    }
    return hospitals;
  }

  Future<List<DoctorModel>> getDoctors({required String hospitalId}) async {
    List<DoctorModel> doctors = [];
    ApiResponseModel response =
        await apiService.get(endpoint: UrlEndPoints.getDoctors + hospitalId);
    if (response.isSuccess) {
      doctors = doctorModelList(response.data['doctors'] ?? []);
    }
    return doctors;
  }

  Future<DoctorModel> getDoctorInHospital({required String doctorId}) async {
    DoctorModel doctor = DoctorModel.fromJson({});
    ApiResponseModel response =
        await apiService.get(endpoint: UrlEndPoints.getDoctors + doctorId);
    if (response.isSuccess) {
      doctor = DoctorModel.fromJson(response.data['doctors'] ?? {});
    }
    return doctor;
  }

  Future<List<RatingModel>> getHospitalRating(
      {required String doctorId}) async {
    List<RatingModel> ratings = [];
    ApiResponseModel response =
        await apiService.get(endpoint: UrlEndPoints.getDoctors + doctorId);
    if (response.isSuccess) {
      ratings = ratingModelList(response.data['ratings'] ?? []);
    }

    return ratings;
  }

  Future<List<PackageModel>> getPackages() async {
    List<PackageModel> packages = [];
    ApiResponseModel response =
        await apiService.get(endpoint: UrlEndPoints.packages);
    if (response.isSuccess) {
      packages = packageModelList(response.data['packages'] ?? []);
    }
    return packages;
  }

  Future<List<UserTypeModel>> getUserTypes() async {
    List<UserTypeModel> userTypeList = [];
    ApiResponseModel response =
        await apiService.get(endpoint: UrlEndPoints.getUserTypes);
    if (response.isSuccess) {
      userTypeList = userTypeModelList(response.data['user_types'] ?? []);
    }
    return userTypeList;
  }
}
