import 'package:get/get.dart';
import '../../constant/app_key_contant.dart';
import '../../constant/url_endpoint.dart';
import '../../utils/app_print.dart';
import '../../widget/app_alerts.dart';
import '../routes/app_routes.dart';
import '../storage/data_store_service.dart';
import '../storage/save_data.dart';
import '../services/api_response_model.dart';
import '../services/api_service.dart';

class AuthService extends GetxService {

  SaveData saveData = SaveData();
  Future loginWithPhoneNumber() async{

  }
  Future googleLogin() async{}
  facebookLogin() async{}

  logoutWithRedirection() async {
    appDebugPrint('logout called');
    appAlerts.customAlert(
      alertTypes: AlertTypes.error,
      title: 'Session Expired',
      message: 'Your login session has expired. Please login again.',
      callback: () async {
        logout();
      },
    );
  }

  checkUserIfAvailable() {
    appDebugPrint(saveData.getToken());
    if (saveData.getToken() != '') {
      return true;
    } else {
      return false;
    }
  }

  logoutApiCall() async {
    ApiResponseModel response =
        await APIService().get(endpoint: UrlEndPoints.Logout, params: {
      'token': saveData.getToken(),
    });
    appDebugPrint(response);
  }

  logout() async {
    await logoutApiCall();
    saveData.clearAll();
    Get.offAllNamed(AppRoutes.login);
    dataStore.clearData();

  }
}
