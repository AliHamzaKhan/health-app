import 'package:flutter/material.dart';

import '../config/size_config.dart';
import '../config/theme/app_colors.dart';
import '../constant/app_key_contant.dart';
import 'app_text.dart';

//ignore: must_be_immutable
class AppDropdown extends StatelessWidget {
  AppDropdown(
      {super.key,
      required this.items,
      required this.onSelected,
      this.isExpanded,
      this.hintText,
      this.height,
      this.background,
      this.borderColor,
      this.textColor,
      this.hintColor,
      this.iconColor,
      this.dropdownColor,
      this.textSize,
      this.radius,
      this.horizontalPadding,
      this.horizontalMargin,
      this.verticalMargin,
      this.enable = true,
      this.width,
      this.value});

  List<String> items;
  var onSelected;
  bool? isExpanded;
  String? hintText;
  double? height;
  Color? background;
  Color? borderColor;
  Color? textColor;
  Color? hintColor;
  Color? iconColor;
  Color? dropdownColor;
  double? textSize;
  double? radius;
  String? value;
  double? horizontalPadding;
  double? horizontalMargin;
  double? verticalMargin;
  bool enable;
  double? width;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      // height: setHeightValue(height ?? 45),
      padding: EdgeInsets.symmetric(
        horizontal: setWidthValue(horizontalPadding ?? 30),
        // vertical: setHeightValue(5)
      ),
      margin: EdgeInsets.symmetric(
          horizontal: setWidthValue(horizontalMargin ?? 30),
          vertical: setHeightValue(verticalMargin ?? 10)),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: background ?? Colors.transparent,
          borderRadius: BorderRadius.circular(setHeightValue(radius ?? 5)),
          border: Border.all(
              color: borderColor ?? AppColors.primary,
              width: setHeightValue(1))),
      child: DropdownButton<String>(
        autofocus: true,
        value: value,
        hint: AppTextRegular(
          text: hintText ?? '',
          size: textSize ?? 11,
          color: hintColor ?? AppColors.background,
        ),
        isExpanded: isExpanded ?? false,
        dropdownColor: dropdownColor ?? AppColors.primary,
        borderRadius: BorderRadius.circular(setHeightValue(radius ?? 5)),
        underline: const SizedBox(),
        alignment: Alignment.center,
        icon: Icon(
          Icons.keyboard_arrow_down,
          size: setHeightValue(20),
          color: iconColor ?? AppColors.background,
        ),
        style: appTextStyleRegular(context,
            color: textColor ?? AppColors.accent,
            size: textSize ?? 12,
            tabSize: (textSize ?? 16) * 3,
        ),
        items: enable
            ? items.map((String e) {
                return DropdownMenuItem<String>(
                    value: e,
                    child: AppTextExtraLight(
                      text: e,
                      color: textColor ??
                          (value == e
                              ? AppColors.text2
                              : AppColors.accent),
                      size: textSize ?? 11,
                      align: TextAlign.center,
                    ));
              }).toList()
            : [],
        onChanged: onSelected,
      ),
    );
  }
}

Widget appDropDownWithCustomLabel(
    {required String label,
    required List<String> items,
    required String value,
    onSelected,
    bool enable = true,
    double? radius,
    double? textSize,
    double? height,
    showLabel = true}) {
  return Container(
    // padding: EdgeInsets.symmetric(horizontal: setWidthValue(30)),
    margin: EdgeInsets.symmetric(vertical: setHeightValue(5)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel)
          AppTextRegular(
            text: label,
            size: 12,
          ),
        AppDropdown(
          enable: enable,
          isExpanded: true,
          value: value == '' ? null : value,
          items: items,
          onSelected: onSelected,
          borderColor: AppColors.accent.withOpacity(0.5),
          background: AppColors.background,
          textColor: AppColors.accent,
          textSize: textSize ?? 14,
          horizontalMargin: 0,
          verticalMargin: 0,
          iconColor: AppColors.accent,
          dropdownColor: AppColors.background,
          radius: radius ?? 5,
          hintText: value == '' ? '' : null,
          height: height,
          
        ),
      ],
    ),
  );
}

Widget appDropDownWithCustomLabelWithId(
    {required String label,
    required List<String> items,
    required String value,
    onSelected,
    bool enable = true,
    double? radius,
    double? textSize,
    double? height,
    showLabel = true}) {
  return Container(
    // padding: EdgeInsets.symmetric(horizontal: setWidthValue(30)),
    margin: EdgeInsets.symmetric(vertical: setHeightValue(5)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showLabel)
          AppTextRegular(
            text: '*$label',
            size: 12,
          ),
        AppDropdown(
          enable: enable,
          isExpanded: true,
          value: value == '' ? null : value,
          items: items,
          onSelected: (value) {
            onSelected(value);
          },
          borderColor: AppColors.accent.withOpacity(0.5),
          background: AppColors.background,
          textColor: AppColors.accent,
          textSize: textSize ?? 14,
          horizontalMargin: 0,
          verticalMargin: 0,
          iconColor: AppColors.accent,
          dropdownColor: AppColors.background,
          radius: radius ?? 20,
          hintText: value == '' ? '' : null,
          height: height,
        ),
      ],
    ),
  );
}
class DropdownWithTitleColumn extends StatelessWidget {
  DropdownWithTitleColumn(
      {super.key,
        this.text = '',
        this.textTypeEnum = TextTypeEnum.Medium,
        this.textSize = 10,
        required this.items,
        required this.value,
        this.hintText,
        this.background,
        this.onSelected});

  String text;
  TextTypeEnum textTypeEnum;
  double textSize;
  List<String> items = [];
  String value;
  String? hintText;
  Color? background;
  Function(String?)? onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (text != '') ...[
          AppText(
            title: text,
            fontSize: textSize,
            textType: textTypeEnum,
          )
        ],
        setHeight(5),
        AppDropdown(
          items: items,
          onSelected: onSelected,
          value: value,
          hintText: hintText ?? 'Select This',
          borderColor: AppColors.borderColor,
          height: 40,
          radius: AppSizeConstant.kCardRadius,
          isExpanded: true,
          background: background,
          textColor: AppColors.text2,
          // textSize: textSize,
        )
      ],
    );
  }
}