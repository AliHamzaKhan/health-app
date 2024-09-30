import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class AppStringConstant {
  static const String kToken = 'token';
  static const String kCompanyName = 'AhkStudio';
  static const String kAppName = 'Health App';



  static const String obTitle1 = 'Schedule Appointments & Medicine Reminders';
  static const String obTitle2 = 'Report Analysis at Your Fingertips';
  static const String obTitle3 = 'Comprehensive Health Monitoring';

  static const String obDesc1 = "Easily schedule your doctor appointments and set medicine reminders to stay on top of your health.";
  static const String obDesc2 = "Upload your medical reports, and we’ll provide comprehensive insights including diagnosis, treatment options, and doctor recommendations.";
  static const String obDesc3 = "Monitor your sugar levels, check your ECG, find nearby hospitals, and take control of your health anytime, anywhere.";




  static const String splashText = "Analyze Your Health with AI-Powered Insights";
  // static const String splashText =  "AI-Powered Health Analysis at Your Fingertips";
  // static const String splashText = "Take Control o/f Your Health with AI-Powered Insights";

}

abstract class AppKeyConstant {
  static const String kToken = 'token';
  static const String kName = 'name';
  static const String kEmail = 'email';
  static const String kCompanyName = 'company';
  static const String kImage = 'image';
  static const String kPassword = 'password';
  static const String kRemember = 'remember';
  static const String firstTime = 'first';
  static const String theme = 'theme';


}

abstract class AppSizeConstant{
  static const double kPadding = 20;
  static const double kRadius = 20;
  static const double kAppRadius = 30;
  static const double kHeaderHeight = 110.0;
  static const int kLoadListSize = 20;
  static const int kPerPageLimit = 20;
  static const double kCardRadius = 10;
}

extension View on num {
  Widget get height => SizedBox(height: toDouble());

  Widget get width => SizedBox(width: toDouble());

}
isTab(){
  return Get.width > 600;
}
getMaxMobile(){
  return 600;
}
