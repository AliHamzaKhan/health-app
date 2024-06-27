import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

ButtonStyle primaryBtnStyle({required ButtonStyleClass buttonStyleClass}) {
  return TextButton.styleFrom(
    foregroundColor: buttonStyleClass.foregroundColor,
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
    padding: EdgeInsets.symmetric(horizontal: buttonStyleClass.horizontalPadding, vertical: buttonStyleClass.verticalPadding),
    elevation: buttonStyleClass.elevation,
    shadowColor: buttonStyleClass.shadowColor,
    shape:  RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(buttonStyleClass.radius)),
    ),
  );
}

ButtonStyle outlineBtnStyle({required ButtonStyleClass buttonStyleClass}) {
  return OutlinedButton.styleFrom(
    foregroundColor: buttonStyleClass.foregroundColor,
    minimumSize: Size(buttonStyleClass.width, buttonStyleClass.height),
    padding: EdgeInsets.symmetric(horizontal: buttonStyleClass.horizontalPadding, vertical: buttonStyleClass.verticalPadding),
    elevation: buttonStyleClass.elevation,
    shadowColor: buttonStyleClass.shadowColor,
    shape:  RoundedRectangleBorder(
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

enum ButtonType { Primary, Secondary, Outline }

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
  ButtonStyleClass(
      {this.height = 36,
      this.horizontalPadding = 16,
      this.radius = 2,
      this.verticalPadding = 5,
      this.width = 88,
      this.backgroundColor = Colors.black87 ,
      this.borderColor=Colors.black87 ,
      this.foregroundColor=Colors.black87,
      this.elevation = 0,
      this.shadowColor});
}
