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
    dataStore.setString(AppStringConstant.kName, name);
  }

  saveEmail(String email) {
    dataStore.setString(AppStringConstant.kEmail, email);
  }

  saveToken(String data) {
    dataStore.setString(AppStringConstant.kToken, data);
  }

  saveImage(String url) {
    dataStore.setString(AppStringConstant.kImage, url);
  }

  saveFirstTime(bool value) {
    dataStore.setBool(AppStringConstant.firstTime, value);
  }

  getFirstTime() {
    return dataStore.getBool(AppStringConstant.firstTime);
  }

  // remember
  saveRememberMe(bool value) {
    dataStore.setBool(AppStringConstant.kRemember, value);
  }

  bool getRememberMe() {
    return dataStore.getBool(AppStringConstant.kRemember);
  }

  // password
  savePassword(String value) {
    dataStore.setString(AppStringConstant.kPassword, value);
  }

  getPassword() {
    return dataStore.getString(AppStringConstant.kPassword);
  }

  getImage() {
    return dataStore.getString(AppStringConstant.kImage);
  }

  getToken() {
    return dataStore.getString(AppStringConstant.kToken);
  }

  getName() {
    return dataStore.getString(AppStringConstant.kName);
  }

  getEmail() {
    return dataStore.getString(AppStringConstant.kEmail);
  }


  saveTheme(bool isDark) {
    dataStore.setBool(AppStringConstant.theme, isDark);
  }

  bool? isDarkTheme() {
    return dataStore.getBool(AppStringConstant.theme) ?? false;
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
      AppStringConstant.kName,
    );
    // dataStore.remove(
    //   AppStringConstant.kEmail,
    // );
    dataStore.remove(
      AppStringConstant.kToken,
    );
    dataStore.remove(
      AppStringConstant.kImage,
    );
    // dataStore.remove(
    //   AppStringConstant.kPassword,
    // );
    dataStore.remove(
      AppStringConstant.dId,
    );
    // dataStore.remove(
    //   AppStringConstant.,
    // );
  }

  logout() async {
    await logoutApiCall();
    clearAll();
    Get.offAllNamed(AppRoutes.login);
    dataStore.clearData();

  }
}
