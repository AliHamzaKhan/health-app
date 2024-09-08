
import 'package:get/get.dart';
import '../services/api_service.dart';
import '../auth/auth_service.dart';

class ApiController extends GetxService {
  APIService apiService = APIService();
  AuthService authService = Get.find();

}
