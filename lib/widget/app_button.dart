import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/services/auth_service.dart';
import '../config/size_config.dart';
import '../config/theme/app_colors.dart';
import 'app_text.dart';

//ignore: must_be_immutable
class AppButton extends StatelessWidget {
  AppButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.isOutline = false,
      this.btnColor,
      this.textColor,
      this.radius,
      this.width,
      this.height,
      this.textSize,
      this.textWeight,
      this.shadow,
      this.shadow1,
      this.gradient,
      this.borderColor,
      this.onDoubleTap,
      this.padding,
      this.margin,
      this.isShadow = false});

  final String title;
  var onTap;
  final bool isOutline;
  Color? btnColor;
  Color? textColor;
  Color? borderColor;
  double? radius;
  double? width;
  double? height;
  double? textSize;
  FontWeight? textWeight;
  double? shadow;
  double? shadow1;
  final bool isShadow;
  var gradient;
  var onDoubleTap;
  EdgeInsets? padding;
  EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: height ?? setHeightValue(45),
        width: width ?? setWidthValue(191),
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: isOutline
              ? (btnColor ?? AppColors.background)
              : (btnColor ?? AppColors.primary),
          borderRadius: BorderRadius.circular(radius ?? setHeightValue(8)),
          border: Border.all(
              color: isOutline
                  ? ((borderColor ?? btnColor) ?? AppColors.primary)
                  : Colors.transparent),
          gradient: gradient,
          boxShadow: isShadow
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.5),
                    spreadRadius: shadow ?? 0,
                    blurRadius: shadow1 ?? 5,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ]
              : [],
        ),
        alignment: Alignment.center,
        child: AppTextSemiBold(
            text: title,
            size: textSize ?? 16,
            weight: textWeight,
            color: textColor ?? Theme.of(context).scaffoldBackgroundColor),
      ),
    );
  }
}

//ignore: must_be_immutable
class PbBackButton extends StatelessWidget {
  PbBackButton(
      {super.key,
      this.icon,
      this.iconColor,
      this.backgroundColor,
      this.size,
      this.iconSize,
      this.onTap,
      this.margin,
      this.radius});

  var onTap;
  IconData? icon;
  Color? iconColor;
  Color? backgroundColor;
  double? size;
  double? iconSize;

  double? margin;
  double? radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            Get.back();
          },
      child: Container(
        width: setHeightValue(size ?? 17),
        height: setHeightValue(size ?? 17),
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(
            horizontal: setHeightValue(margin ?? 0),
            vertical: setHeightValue(margin ?? 0)),
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(setHeightValue(radius ?? 17) / 2),
            color: backgroundColor ?? AppColors.accent),
        child: Icon(
          icon ?? Icons.arrow_back,
          color: iconColor ?? AppColors.primary,
          size: setHeightValue(iconSize ?? 12),
        ),
      ),
    );
  }
}

//ignore: must_be_immutable
class AppIconButton extends StatelessWidget {
  AppIconButton(
      {required this.icon,
      required this.onTap,
      this.isOutline = false,
      this.btnColor,
      this.iconColor,
      this.radius,
      this.width,
      this.height,
      this.iconSize,
      this.textWeight,
      this.shadow,
      this.shadow1,
      this.gradient,
      this.borderColor,
      // this.onDoubleTap,
      this.padding,
      this.margin,
      this.isShadow = false});

  final dynamic icon;
  var onTap;
  final bool isOutline;
  Color? btnColor;
  Color? iconColor;
  Color? borderColor;
  double? radius;
  double? width;
  double? height;
  double? iconSize;
  FontWeight? textWeight;
  double? shadow;
  double? shadow1;
  final bool isShadow;
  var gradient;

  // var onDoubleTap;
  EdgeInsets? padding;
  EdgeInsets? margin;
  List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onDoubleTap: onDoubleTap,
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: height ?? setHeightValue(36),
        width: width ?? setHeightValue(36),
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: isOutline
              ? (btnColor ?? Theme.of(context).scaffoldBackgroundColor)
              : (btnColor ?? Theme.of(context).scaffoldBackgroundColor),
          borderRadius: BorderRadius.circular(radius ?? setHeightValue(36)),
          border: Border.all(
              color: isOutline
                  ? ((borderColor ?? btnColor) ?? AppColors.primary)
                  : Colors.transparent),
          gradient: gradient,
          boxShadow: isShadow
              ? (boxShadow ?? [
            BoxShadow(
              color: ((Get.find<AuthService>().isDarkTheme() ?? false)
                  ? AppColors.background
                  : AppDarkColors.background)
                  .withOpacity(0.05),
              spreadRadius: shadow ?? 3,
              blurRadius: shadow1 ?? 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ])
              : [],
        ),
        alignment: Alignment.center,
        child: icon is String
            ? Image.asset(
                icon,
                width: setHeightValue(iconSize ?? 17),
                height: setHeightValue(iconSize ?? 17),
                color: iconColor ??
                    ((Get.find<AuthService>().isDarkTheme() ?? false)
                        ? AppColors.background
                        : AppDarkColors.background),
                fit: BoxFit.cover,
              )
            : Icon(
                icon,
                size: setHeightValue(iconSize ?? 17),
                color: iconColor ??
                    ((Get.find<AuthService>().isDarkTheme() ?? false)
                        ? AppColors.background
                        : AppDarkColors.background),
              ),
      ),
    );
  }
}

