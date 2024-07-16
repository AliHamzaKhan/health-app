


import 'package:get/get.dart';
import 'package:health_app/config/routes/app_routes.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 1), (){
      Get.toNamed(AppRoutes.onBoarding);
    });
  }
}