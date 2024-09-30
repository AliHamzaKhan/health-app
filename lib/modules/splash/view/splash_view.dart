import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:health_app/constant/app_key_contant.dart';
import 'package:health_app/constant/assets_contant.dart';
import 'package:health_app/widget/app_text.dart';
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
          Image.asset(AssetsConstant.appIconTransparent),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  AppStringConstant.splashText,
                  textAlign: TextAlign.center,
                  textStyle: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                  speed: const Duration(milliseconds: 50),
                ),
              ],
              totalRepeatCount: 1,
              pause: const Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
              onFinished: (){
                controller.gotoRoute();
              },
            ),
          )
        ],
      ),
    );
  }
}
