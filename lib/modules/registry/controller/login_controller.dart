import 'package:get/get.dart';
import 'package:health_app/config/api/api_response_model.dart';
import 'package:health_app/config/api/api_service.dart';
import 'package:health_app/config/auth/phone_auth_service.dart';
import 'package:health_app/config/controllers/api_controller.dart';
import 'package:health_app/constant/url_endpoint.dart';
import 'package:health_app/utils/app_print.dart';

import '../../../config/routes/app_routes.dart';

class LoginController extends GetxController {
  PhoneAuthService phoneAuthService = PhoneAuthService();
  String phoneNo = '';
  ApiController apiController = Get.find();

  login() async {
    // appDebugPrint('login');
    // ApiResponseModel response = await APIService().get(
    //     endpoint: '${UrlEndPoints.getProfile}caf435da-91e7-4b9a-849b-25b81e6266ff');
    // appDebugPrint(response);
    // return;

    // apiController.login(userTypeId: 1, email: '', phoneNo: '');
    //
    Get.toNamed(AppRoutes.otp);
    return;
    await phoneAuthService.verifyPhoneNumber(phoneNo, (code) {
      appDebugPrint('code $code');
    }, (error) {
      appDebugPrint('error $error');
    });
  }
}
