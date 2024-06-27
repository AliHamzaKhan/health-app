


import 'package:flutter/material.dart';

import 'app_colors.dart';

appTextStyleExtraLight(context,
    {Color? color,
      double? size,
      FontWeight? weight,
      double? tabSize,
      TextDecoration? decoration,
      TextOverflow? overFlow,
      double? decorationThickness,
      TextDecorationStyle? decorationStyle,
      double? letterSpacing}) {
  return Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: color,
      fontSize: size,
      fontWeight: weight ?? FontWeight.w300,
      overflow: overFlow ?? TextOverflow.ellipsis,
      decoration: decoration ?? TextDecoration.none,
      decorationColor: color ?? AppColors.text,
      decorationThickness: decorationThickness,
      decorationStyle: decorationStyle ?? TextDecorationStyle.solid,
      letterSpacing: letterSpacing);
}
appTextStyleRegular(context,
    {Color? color,
      double? size,
      FontWeight? weight,
      double? tabSize,
      TextDecoration? decoration,
      TextOverflow? overFlow,
      double? decorationThickness,
      TextDecorationStyle? decorationStyle,
      double? letterSpacing}) {
  return Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: color,
      fontSize: size,
      fontWeight: weight ?? FontWeight.w600,
      overflow: overFlow ?? TextOverflow.ellipsis,
      decoration: decoration ?? TextDecoration.none,
      decorationColor: color ?? AppColors.text,
      decorationThickness: decorationThickness,
      decorationStyle: decorationStyle ?? TextDecorationStyle.solid,
      letterSpacing: letterSpacing);
}

appTextStyleMedium(context,
    {Color? color,
      double? size,
      FontWeight? weight,
      double? tabSize,
      TextDecoration? decoration,
      TextOverflow? overFlow,
      double? decorationThickness,
      TextDecorationStyle? decorationStyle,
      double? letterSpacing}) {
  return Theme.of(context).textTheme.bodyMedium?.copyWith(
      color: color,
      fontSize: size,
      fontWeight: weight ?? FontWeight.w700,
      overflow: overFlow ?? TextOverflow.ellipsis,
      decoration: decoration ?? TextDecoration.none,
      decorationColor: color ?? AppColors.text,
      decorationThickness: decorationThickness,
      decorationStyle: decorationStyle ?? TextDecorationStyle.solid,
      letterSpacing: letterSpacing);
}
appTextStyleSemiBold(context,
    {Color? color,
      double? size,
      FontWeight? weight,
      double? tabSize,
      TextDecoration? decoration,
      TextOverflow? overFlow,
      double? decorationThickness,
      TextDecorationStyle? decorationStyle,
      double? letterSpacing}) {
  return Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: color,
      fontSize: size,
      fontWeight: weight ?? FontWeight.w800,
      overflow: overFlow ?? TextOverflow.ellipsis,
      decoration: decoration ?? TextDecoration.none,
      decorationColor: color ?? AppColors.text,
      decorationThickness: decorationThickness,
      decorationStyle: decorationStyle ?? TextDecorationStyle.solid,
      letterSpacing: letterSpacing);
}

appTextStyleBold(context,
    {Color? color,
      Color? decorationColor,
      double? size,
      FontWeight? weight,
      double? tabSize,
      TextDecoration? decoration,
      TextOverflow? overFlow,
      double? decorationThickness,
      TextDecorationStyle? decorationStyle,
      double? letterSpacing}) {
  return Theme.of(context).textTheme.titleMedium!.copyWith(
      color: color,
      fontSize: size,
      fontWeight: weight ?? FontWeight.w900,
      overflow: overFlow ?? TextOverflow.ellipsis,
      decoration: decoration ?? TextDecoration.none,
      decorationColor: color ?? AppColors.text,
      decorationThickness: decorationThickness,
      decorationStyle: decorationStyle ?? TextDecorationStyle.solid,
      letterSpacing: letterSpacing);
}



