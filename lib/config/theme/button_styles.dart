import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:health_app/config/size_config.dart';
import 'package:health_app/config/theme/app_colors.dart';
import 'package:health_app/constant/app_key_contant.dart';
import 'package:health_app/utils/app_print.dart';

ButtonStyle primaryBtnStyle({required ButtonStyleClass buttonStyleClass}) {
  appDebugPrint('buttonStyleClass.width ${buttonStyleClass.width}');
  return TextButton.styleFrom(
    // foregroundColor: buttonStyleClass.foregroundColor,
    backgroundColor: buttonStyleClass.backgroundColor,
    minimumSize: Size(buttonStyleClass.width, buttonStyleClass.height),
    padding: EdgeInsets.symmetric(
        horizontal: buttonStyleClass.height,
        vertical: buttonStyleClass.verticalPadding),
    elevation: buttonStyleClass.elevation,
    shadowColor: buttonStyleClass.shadowColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(buttonStyleClass.radius)),
    ),
  );
}

ButtonStyle secondaryBtnStyle({required ButtonStyleClass buttonStyleClass}) {
  return ElevatedButton.styleFrom(
    foregroundColor: buttonStyleClass.foregroundColor,
    backgroundColor: buttonStyleClass.backgroundColor,
    minimumSize: Size(buttonStyleClass.width, buttonStyleClass.height),
    padding: EdgeInsets.symmetric(
        horizontal: buttonStyleClass.horizontalPadding,
        vertical: buttonStyleClass.verticalPadding),
    elevation: buttonStyleClass.elevation,
    shadowColor: buttonStyleClass.shadowColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(buttonStyleClass.radius)),
    ),
  );
}

ButtonStyle outlineBtnStyle({required ButtonStyleClass buttonStyleClass}) {
  return OutlinedButton.styleFrom(
    foregroundColor: buttonStyleClass.foregroundColor,
    minimumSize: Size(buttonStyleClass.width, buttonStyleClass.height),
    padding: EdgeInsets.symmetric(
        horizontal: buttonStyleClass.horizontalPadding,
        vertical: buttonStyleClass.verticalPadding),
    elevation: buttonStyleClass.elevation,
    shadowColor: buttonStyleClass.shadowColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(buttonStyleClass.radius)),
    ),
  ).copyWith(
    side: MaterialStateProperty.resolveWith<BorderSide?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return BorderSide(
            color: buttonStyleClass.borderColor,
            width: 1,
          );
        }
        return null;
      },
    ),
  );
}

enum ButtonType { Primary, Secondary, Outline, Floating }

class ButtonStyleClass {
  Color foregroundColor;
  Color backgroundColor;
  Color borderColor;
  double width;
  double height;
  double radius;
  double horizontalPadding;
  double verticalPadding;
  double elevation;
  Color? shadowColor;
  Color? iconColor;

  ButtonStyleClass({
    double? width,
    double? height,
    double? radius,
    double? horizontalPadding,
    double? verticalPadding,
    Color? backgroundColor,
    Color? borderColor,
    Color? foregroundColor,
    this.elevation = 0,
    this.shadowColor,
    this.iconColor,
  })  : backgroundColor = backgroundColor ?? AppColors.primary,
        foregroundColor = foregroundColor ?? AppColors.primary,
        borderColor = borderColor ?? AppColors.primary,
        height =  setHeightValue(height ?? 50),
        width = width ?? Get.width,
        radius = radius ?? (AppSizeConstant.kRadius),
        horizontalPadding = horizontalPadding ?? (AppSizeConstant.kPadding),
        verticalPadding = verticalPadding ?? 5;
}
