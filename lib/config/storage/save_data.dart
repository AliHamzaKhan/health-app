


import '../../constant/app_key_contant.dart';
import 'data_store_service.dart';

class SaveData {
  void saveAll({
    String? id,
    String? name,
    String? email,
    String? token,
    String? image,
    bool? firstTime,
    bool? rememberMe,
    String? password,
    bool? isDarkTheme,
  }) {
    if(id != null){
      saveId(id);
    }
    if (name != null) {
      saveName(name);
    }
    if (email != null) {
      saveEmail(email);
    }
    if (token != null) {
      saveToken(token);
    }
    if (image != null) {
      saveImage(image);
    }
    if (firstTime != null) {
      saveFirstTime(firstTime);
    }
    if (rememberMe != null) {
      saveRememberMe(rememberMe);
    }
    if (password != null) {
      savePassword(password);
    }
    if (isDarkTheme != null) {
      saveTheme(isDarkTheme);
    }
  }

  // Save methods

  void saveId(String name) {
    dataStore.setString(AppKeyConstant.kId, name);
  }
  void saveName(String name) {
    dataStore.setString(AppKeyConstant.kName, name);
  }

  void saveEmail(String email) {
    dataStore.setString(AppKeyConstant.kEmail, email);
  }

  void saveToken(String token) {
    dataStore.setString(AppKeyConstant.kToken, token);
  }

  void saveImage(String image) {
    dataStore.setString(AppKeyConstant.kImage, image);
  }

  void saveFirstTime(bool firstTime) {
    dataStore.setBool(AppKeyConstant.firstTime, firstTime);
  }

  void saveRememberMe(bool remember) {
    dataStore.setBool(AppKeyConstant.kRemember, remember);
  }

  void savePassword(String password) {
    dataStore.setString(AppKeyConstant.kPassword, password);
  }

  void saveTheme(bool isDarkTheme) {
    dataStore.setBool(AppKeyConstant.theme, isDarkTheme);
  }

  // Retrieve methods

  String getId() {
    return dataStore.getString(AppKeyConstant.kId) ?? '';
  }

  String getName() {
    return dataStore.getString(AppKeyConstant.kName) ?? '';
  }

  String getEmail() {
    return dataStore.getString(AppKeyConstant.kEmail) ?? '';
  }

  String getToken() {
    return dataStore.getString(AppKeyConstant.kToken) ?? '';
  }

  String getImage() {
    return dataStore.getString(AppKeyConstant.kImage) ?? '';
  }

  bool getFirstTime() {
    return dataStore.getBool(AppKeyConstant.firstTime) ?? false;
  }

  bool getRememberMe() {
    return dataStore.getBool(AppKeyConstant.kRemember) ?? false;
  }

  String getPassword() {
    return dataStore.getString(AppKeyConstant.kPassword) ?? '';
  }

  bool isDarkTheme() {
    return dataStore.getBool(AppKeyConstant.theme) ?? false;
  }
  void clearAll(){
    dataStore.remove(AppKeyConstant.kName);
    dataStore.remove(AppKeyConstant.kEmail);
    dataStore.remove(AppKeyConstant.kToken);
    dataStore.remove(AppKeyConstant.kImage);
    dataStore.remove(AppKeyConstant.kPassword);
    dataStore.remove(AppKeyConstant.kRemember);
    dataStore.remove(AppKeyConstant.firstTime);
    dataStore.remove(AppKeyConstant.theme);
  }
}