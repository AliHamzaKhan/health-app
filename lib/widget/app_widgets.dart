import 'package:flutter/material.dart';
import 'package:health_app/constant/assets_contant.dart';
import 'package:health_app/widget/app_image.dart';

import 'app_text.dart';

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

Widget appIconImage({Size? size}) {
  return ImageDisplay(image: AssetsConstant.appIconTransparent, size: size ?? Size(100, 100));
}
Widget appHeaderText(String title){
  return AppText(
    title: title,
    textType: TextTypeEnum.Bold,
    fontSize: 20,
  );
}
Widget appSubtitleText(String title){
  return AppText(
    title: title,
    textType: TextTypeEnum.Medium,
    overflow: TextOverflow.clip,
    textAlign: TextAlign.center,
  );
}

