


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CbSizeConfig{
  static getWidth() => Get.width;
  static getHeight() => Get.height;
}

setHeightValue(double value){
  return CbSizeConfig.getHeight() * (value * 0.001);
}
setWidthValue(double value){
  return CbSizeConfig.getWidth() * (value * 0.001);
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