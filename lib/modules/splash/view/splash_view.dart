


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:health_app/constant/assets_contant.dart';
import '../../../widget/app_scaffold.dart';
import '../controller/splash_controller.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});

  var controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AssetsConstant.appIconTransparent
          )
        ],
      ),
    );
  }
}
