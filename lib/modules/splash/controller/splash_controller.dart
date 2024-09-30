


import 'package:get/get.dart';
import 'package:health_app/config/routes/app_routes.dart';

class SplashController extends GetxController{


  gotoRoute(){
    Future.delayed(const Duration(milliseconds: 500), (){
      Get.toNamed(AppRoutes.onBoarding);
    });
  }
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 1), (){
      // Get.toNamed(AppRoutes.onBoarding);
    });
  }
}