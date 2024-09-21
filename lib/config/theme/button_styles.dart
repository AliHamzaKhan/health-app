import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_key_contant.dart';
import '../../utils/app_print.dart';
import '../size_config.dart';
import 'app_colors.dart';

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
    alignment: Alignment.center,
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
    alignment: Alignment.center,
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
    side: BorderSide(color: buttonStyleClass.borderColor),
    foregroundColor: buttonStyleClass.foregroundColor,
    minimumSize: Size(buttonStyleClass.width, buttonStyleClass.height),
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(
        horizontal: buttonStyleClass.horizontalPadding,
        vertical: buttonStyleClass.verticalPadding),
    elevation: buttonStyleClass.elevation,
    shadowColor: buttonStyleClass.shadowColor,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: buttonStyleClass.borderColor),
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
  Color textColor;
  double textSize;

  ButtonStyleClass({
    double? width,
    double? height,
    double? radius,
    double? horizontalPadding,
    double? verticalPadding,
    Color? backgroundColor,
    Color? borderColor,
    Color? foregroundColor,
    Color? textColor,
    double? textSize,
    this.elevation = 0,
    this.shadowColor,
    this.iconColor,
  })  : backgroundColor = backgroundColor ?? AppColors.primary,
        foregroundColor = foregroundColor ?? AppColors.primary,
        borderColor = borderColor ?? AppColors.primary,
        textColor = textColor ?? AppColors.background,
        height =  setHeightValue(height ?? 50),
        width = width ?? Get.width,
        radius = radius ?? 10,
        horizontalPadding = horizontalPadding ?? (AppSizeConstant.kPadding),
        textSize = textSize ?? 14,
        verticalPadding = verticalPadding ?? 5;
}
