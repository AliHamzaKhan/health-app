import 'package:get/get.dart';
import 'package:health_app/config/auth/phone_auth_service.dart';
import 'package:health_app/utils/app_print.dart';

class LoginController extends GetxController {
  PhoneAuthService phoneAuthService = PhoneAuthService();
  String phoneNo = '';

  login() async {
    if (phoneNo.length > 9) {
      await phoneAuthService.verifyPhoneNumber(phoneNo, (code) {
        appDebugPrint('code $code');
      }, (error) {
        appDebugPrint('error $error');
      });
    }
  }
}
