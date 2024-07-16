import 'package:get/get.dart';
import '../../constant/app_key_contant.dart';
import '../../constant/url_endpoint.dart';
import '../../utils/app_print.dart';
import '../../widget/app_alerts.dart';
import '../routes/app_routes.dart';
import '../storage/data_store_service.dart';
import 'api_response_model.dart';
import 'api_service.dart';

class AuthService extends GetxService {
  saveName(String name) {
    dataStore.setString(AppKeyConstant.kName, name);
  }

  saveEmail(String email) {
    dataStore.setString(AppKeyConstant.kEmail, email);
  }

  saveToken(String data) {
    dataStore.setString(AppKeyConstant.kToken, data);
  }

  saveImage(String url) {
    dataStore.setString(AppKeyConstant.kImage, url);
  }

  saveFirstTime(bool value) {
    dataStore.setBool(AppKeyConstant.firstTime, value);
  }

  getFirstTime() {
    return dataStore.getBool(AppKeyConstant.firstTime);
  }

  // remember
  saveRememberMe(bool value) {
    dataStore.setBool(AppKeyConstant.kRemember, value);
  }

  bool getRememberMe() {
    return dataStore.getBool(AppKeyConstant.kRemember);
  }

  // password
  savePassword(String value) {
    dataStore.setString(AppKeyConstant.kPassword, value);
  }

  getPassword() {
    return dataStore.getString(AppKeyConstant.kPassword);
  }

  getImage() {
    return dataStore.getString(AppKeyConstant.kImage);
  }

  getToken() {
    return dataStore.getString(AppKeyConstant.kToken);
  }

  getName() {
    return dataStore.getString(AppKeyConstant.kName);
  }

  getEmail() {
    return dataStore.getString(AppKeyConstant.kEmail);
  }


  saveTheme(bool isDark) {
    dataStore.setBool(AppKeyConstant.theme, isDark);
  }

  bool? isDarkTheme() {
    return dataStore.getBool(AppKeyConstant.theme) ?? false;
  }


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
    appDebugPrint(getToken());
    if (getToken() != '') {
      return true;
    } else {
      return false;
    }
  }

  logoutApiCall() async {
    ApiResponseModel response =
        await APIService().get(endpoint: UrlEndPoints.Logout, params: {
      'token': getToken(),
    });
    appDebugPrint(response);
  }

  clearAll() {
    dataStore.remove(
      AppKeyConstant.kName,
    );
    // dataStore.remove(
    //   AppStringConstant.kEmail,
    // );
    dataStore.remove(
      AppKeyConstant.kToken,
    );
    dataStore.remove(
      AppKeyConstant.kImage,
    );

  }

  logout() async {
    await logoutApiCall();
    clearAll();
    Get.offAllNamed(AppRoutes.login);
    dataStore.clearData();

  }
}
