


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HaSizeConfig{
  static getWidth() => Get.width;
  static getHeight() => Get.height;
}

setHeightValue(double value){
  return HaSizeConfig.getHeight() * (value * 0.001);
}
setWidthValue(double value){
  return HaSizeConfig.getWidth() * (value * 0.001);
}

setHeight(double value){
  return SizedBox(
    height: setHeightValue(value),
  );
}
setWidth(double value){
  return SizedBox(
    width: setHeightValue(value),
  );
}

EdgeInsets appPadding = EdgeInsets.symmetric(
  horizontal: setWidthValue(20),
  vertical: setHeightValue(5)
);