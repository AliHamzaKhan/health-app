
import 'package:get/get.dart';
import '../api/api_service.dart';
import '../auth/auth_service.dart';

class ApiController extends GetxService {
  APIService apiService = APIService();
  AuthService authService = Get.find();

  Future saveProfile() async{}
  Future getProfile() async{}
}
