import 'package:flutter/material.dart';
import '../config/size_config.dart';
import '../config/theme/app_colors.dart';
enum DividerType { Horizontal, Vertical }

Widget appDivider({DividerType dividerType = DividerType.Horizontal,EdgeInsets? padding, double? height}) {
  return dividerType == DividerType.Horizontal
      ? Padding(
        padding: padding ?? EdgeInsets.symmetric(
          horizontal: setWidthValue(50),
          vertical: setHeightValue(5)
        ),
        child: Divider(
          height: height ?? 5,
          color: AppColors.card,
        ),
      )
      : const VerticalDivider();
}
