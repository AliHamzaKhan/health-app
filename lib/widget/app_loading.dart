import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../config/theme/app_colors.dart';
import 'app_loader_animation.dart';


class AppLoader {
  static showLoading({String? message}) async {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..indicatorColor = Colors.transparent
      ..backgroundColor = Colors.transparent
      ..textColor = Colors.transparent
      ..boxShadow = <BoxShadow>[]
      ..maskColor = AppColors.text.withOpacity(0.5)
      ..customAnimation = CbLoadingAnimation();

    await EasyLoading.show(
        status: message,
        maskType: EasyLoadingMaskType.custom,
        dismissOnTap: false,
        indicator: SizedBox(
          width: 50,
          height: 50,
          child: LoadingIndicator(
              indicatorType: Indicator.ballSpinFadeLoader,
              colors: [
                AppColors.primary,
                AppColors.primary.withOpacity(0.7),
                AppColors.primary.withOpacity(0.5)],
              strokeWidth: 5,
              backgroundColor: Colors.transparent,
              pathBackgroundColor: Colors.transparent),
        ));
  }

  static success({String? message, int duration = 3}) async {
    EasyLoading.instance

      ..backgroundColor = message != null ? AppColors.primary : Colors.transparent
      ..dismissOnTap = true;
    await EasyLoading.show(
      status: message,
      maskType: EasyLoadingMaskType.black,
      indicator: Stack(
        children: <Widget>[
          SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                color: AppColors.primary,
                value: 1,
                backgroundColor: AppColors.background,
                strokeWidth: 10,
              )),
          Positioned(
            left: 12,
            top: 12,
            child: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(75),
                color: AppColors.primary,
              ),
              child: Center(
                child: Icon(Icons.check, color: AppColors.background, size: 70),
              ),
            ),
          )
        ],
      ),
    );

    Timer(
      Duration(seconds: message != null ? duration : 1),
      () => EasyLoading.dismiss(),
    );
  }

  static dismiss() {
    EasyLoading.dismiss();
  }

  static fail({String? error}) async {
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..indicatorColor = Colors.transparent
      ..backgroundColor = error != null
          ? AppColors.background
          : Colors.transparent
      ..dismissOnTap = true
      ..boxShadow = <BoxShadow>[]
      ..maskColor = AppColors.text.withOpacity(0.5)
      ..customAnimation = CbLoadingAnimation();

    await EasyLoading.show(
      status: error,
      maskType: EasyLoadingMaskType.black,
      dismissOnTap: true,
      indicator: Stack(
        children: <Widget>[
          SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                color: AppColors.danger,
                backgroundColor: AppColors.background,
                value: 1,
                strokeWidth: 10,
              )),
          Positioned(
            left: 12,
            top: 12,
            child: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(75),
                color: AppColors.danger,
              ),
              child: Center(
                child: Icon(Icons.error_outline,
                    color: AppColors.background, size: 70),
              ),
            ),
          )
        ],
      ),
    );

    Timer(Duration(seconds: error != null ? 5 : 1), () => EasyLoading.dismiss());
  }
}
