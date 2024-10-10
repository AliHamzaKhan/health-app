


import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:health_app/config/theme/app_colors.dart';
import 'package:health_app/widget/app_text.dart';

showToast({required String title,required String message, bool isError = false, SnackPosition snackPosition = SnackPosition.TOP, int durationInMilliseconds = 1000}){
  Get.snackbar(
    title,
    message,
    titleText: AppText(title: title, color: Colors.white,textType: TextTypeEnum.Bold,),
    messageText: AppText(title: message, color: Colors.white,),
    backgroundColor: isError ? redColor : darkGreenColor,
    snackPosition: snackPosition,
    duration: Duration(milliseconds: durationInMilliseconds)
  );
}