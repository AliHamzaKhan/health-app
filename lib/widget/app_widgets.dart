import 'package:flutter/material.dart';

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
