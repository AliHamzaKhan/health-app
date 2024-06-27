


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../storage/data_store_service.dart';
import 'en_us.dart';

class TranslationService extends Translations {
  static String get langCode => 'langCode';

  static String get countryCode => 'countryCode';

  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('en', 'US');

  static var initialTextDirection = TextDirection.ltr; // Default to LTR

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUS,
    // 'ur_PK': urPK,
    // 'ar_SA': arSA,
  };

  getCurrentDirection() {
    var langCode = dataStore.getString("langCode");
    if (langCode.isNotEmpty) {
      print(langCode);
      var array = langCode.split('_');
      if (array.isNotEmpty && array.length >= 2) {
        if (array[0] != 'en') {
          initialTextDirection = TextDirection.rtl;
        } else {
          initialTextDirection = TextDirection.ltr;
        }
      }
    }
    return initialTextDirection;
  }

  static Locale setLanguage() {
    var langCode = dataStore.getString("langCode");
    if (langCode.isNotEmpty) {
      print(langCode);
      var array = langCode.split('_');
      if (array.isNotEmpty && array.length >= 2) {
        if (array[0] != 'en') {
          initialTextDirection = TextDirection.rtl;
        }
        return Locale(
          array[0],
          array[1],
        );
      }
    }
    return const Locale('en', 'US');
  }

  String currentLang() {
    var langCode = dataStore.getString("langCode");
    if (langCode.isNotEmpty) {
      print(langCode);
      var array = langCode.split('_');
      if (array.isNotEmpty && array.length >= 2) {
        return array[0];
      } else {
        return 'en';
      }
    } else {
      return 'en';
    }
  }

  changeLanguage(String langCode, String countryCode) {
    dataStore.setString(TranslationService.langCode, langCode);
    dataStore.setString(TranslationService.countryCode, countryCode);
    Get.updateLocale(Locale(langCode, countryCode));
  }
}