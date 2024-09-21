import 'package:flutter/material.dart';
import 'package:health_app/constant/assets_contant.dart';
import 'package:health_app/widget/app_image.dart';

setImage(
    {required String image,
    double? width,
    double? height,
    Color? color,
    BoxFit? fit}) {
  return Image.asset(
    image,
    width: width,
    height: height,
    color: color,
    fit: fit,
  );
}

Widget appIconImage() {
  return ImageDisplay(image: AssetsConstant.appIcon, size: Size(100, 100));
}
