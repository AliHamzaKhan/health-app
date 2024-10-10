import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:health_app/config/api/api_response_model.dart';
import 'package:health_app/config/api/api_service.dart';
import 'package:health_app/config/auth/phone_auth_service.dart';
import 'package:health_app/config/controllers/api_controller.dart';
import 'package:health_app/constant/url_endpoint.dart';
import 'package:health_app/utils/app_print.dart';
import '../../../config/model/user_type_model.dart';
import '../../../config/routes/app_routes.dart';

class LoginController extends GetxController {
  PhoneAuthService phoneAuthService = PhoneAuthService();
  String phoneNo = '+923222319787';
  ApiController apiController = Get.find();
  Rx<UserTypeModel> selectedUserType = UserTypeModel.fromJson({}).obs;

  login() async {
    // final fcmToken = await FirebaseMessaging.instance.getToken();
    // appDebugPrint(fcmToken);
    // appDebugPrint('login');
    // ApiResponseModel response = await APIService().get(
    //     endpoint: '${UrlEndPoints.getProfile}caf435da-91e7-4b9a-849b-25b81e6266ff');
    // appDebugPrint(response);
    // return;

    // apiController.login(
    //     userTypeId: selectedUserType.value.userTypeId,
    //     email: '',
    //     phoneNo: phoneNo);
    //
    Get.toNamed(AppRoutes.otp);
    return;
    await phoneAuthService.verifyPhoneNumber(phoneNo, (code) {
      appDebugPrint('code $code');
    }, (error) {
      appDebugPrint('error $error');
    });
  }

  getArgs() {
    selectedUserType.value = Get.arguments['args'] ?? UserTypeModel.fromJson({});
    appDebugPrint(selectedUserType.value.userTypeId);
  }

  @override
  void onInit() {
    super.onInit();
    getArgs();
  }
}
