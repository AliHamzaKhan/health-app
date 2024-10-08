import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../config/size_config.dart';
import '../config/theme/app_colors.dart';

enum TextTypeEnum { ExtraLight, Regular, Medium, Bold, ExtraBold }

class AppText extends StatelessWidget {
  AppText(
      {super.key,
      required this.title,
      this.textType = TextTypeEnum.Regular,
      this.fontSize,
      this.overflow = TextOverflow.ellipsis,
      this.decoration = TextDecoration.none,
      this.decorationStyle = TextDecorationStyle.solid,
      this.decorationThickness,
      this.letterSpacing,
      this.color,
      this.textAlign = TextAlign.left, this.maxLines = 1
      });

  TextTypeEnum textType;
  String title;
  double? fontSize;
  TextOverflow overflow;
  TextDecoration decoration;
  double? decorationThickness;
  TextDecorationStyle decorationStyle;
  double? letterSpacing;
  Color? color;
  TextAlign textAlign;
  int maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: getStyle(context),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }

  FontWeight getWeight() {
    switch (textType) {
      case TextTypeEnum.ExtraLight:
        return FontWeight.w100;
      case TextTypeEnum.Regular:
        return FontWeight.normal;
      case TextTypeEnum.Medium:
        return FontWeight.w600;
      case TextTypeEnum.Bold:
        return FontWeight.w800;
      case TextTypeEnum.ExtraBold:
        return FontWeight.w900;
    }
  }

  getSize() {
    switch (textType) {
      case TextTypeEnum.ExtraLight:
        return fontSize ?? 13;
      case TextTypeEnum.Regular:
        return fontSize ?? 14;
      case TextTypeEnum.Medium:
        return fontSize ?? 16;
      case TextTypeEnum.Bold:
        return fontSize ?? 15;
      case TextTypeEnum.ExtraBold:
        return fontSize ?? 12;
    }
  }

  getStyle(context) {
    return TextStyle(
        fontWeight: getWeight(),
        color: color ?? (Theme.of(context).textTheme.bodyMedium?.color ?? AppColors.text),
        fontSize: getSize(),
        overflow: overflow,
        decoration:decoration,
        decorationColor: color ?? (Theme.of(context).textTheme.bodyMedium?.color ?? AppColors.text),
        decorationThickness: decorationThickness,
        decorationStyle:  decorationStyle,
        letterSpacing: letterSpacing,

    );
  }
}
Widget TitleSubTitleText({
  required String head,
  required String title,
  // maxLines,
  CrossAxisAlignment? crossAxisAlignment,
  int? headFlex,
  Color? titleColor,
  Color? headColor,
  MainAxisAlignment? mainAxisAlignment,
  TextAlign? align,
  TextOverflow? titleOverFlow,
  int titleMaxLines = 1
}) {
  return Row(
    mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
    crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
    children: [
      AppText(
        title: '$head : ',
        fontSize: 14,
        color: headColor,
        textAlign: TextAlign.left,
        textType: TextTypeEnum.Bold,
      ),
      setWidth(10),
      Expanded(
          child: AppText(
            title: title,
            fontSize: 14,
            color: titleColor,
            textAlign: align ?? TextAlign.start,
            overflow: titleOverFlow ?? TextOverflow.clip,
            textType: TextTypeEnum.Regular,
            maxLines: titleMaxLines,
          )),
    ],
  );
}

Widget TitleSubTitleColumnText(
    {required String head,
      required String title,
      maxLines,
      CrossAxisAlignment? crossAxisAlignment,
      MainAxisAlignment? mainAxisAlignment,
      int? headFlex,
      titleColor,
      double? titleSize,
      double? headeSize,
      FontWeight? weight,
      double midPadding = 10,
      TextAlign? titleTextAlign}) {
  return Column(
    mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
    crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
    children: [
      AppText(
        title: head,
        fontSize: headeSize ?? 14,
        textAlign: TextAlign.left,
        textType: TextTypeEnum.Bold,
      ),
      setHeight(midPadding),
      AppText(
        title: title,
        fontSize: titleSize ?? 14,
        color: titleColor,
        textAlign:  titleTextAlign ?? TextAlign.start,
        overflow: TextOverflow.clip,
        textType: TextTypeEnum.Medium,
      ),
    ],
  );
}

//ignore: must_be_immutable
class AppTextRegular extends StatelessWidget {
  AppTextRegular(
      {super.key,
      required this.text,
      this.color,
      this.size,
      this.weight,
      this.align,
      this.maxLines,
      this.overFlow,
      this.decorationThickness,
      this.decorationStyle,
      this.decoration});

  String text;
  Color? color;
  double? size;
  FontWeight? weight;
  TextAlign? align;
  int? maxLines;
  TextOverflow? overFlow;
  TextDecoration? decoration;
  double? decorationThickness;
  TextDecorationStyle? decorationStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: appTextStyleRegular(context,
          weight: weight ?? FontWeight.w500,
          size: size ?? 20,
          color: color,
          decoration: decoration,
          decorationThickness: decorationThickness,
          decorationStyle: decorationStyle),
      overflow: overFlow ?? TextOverflow.ellipsis,
      textAlign: align ?? TextAlign.left,
    );
  }
}

//ignore: must_be_immutable
class AppTextMedium extends StatelessWidget {
  AppTextMedium(
      {super.key,
      required this.text,
      this.color,
      this.size,
      this.weight,
      this.align,
      this.maxLines,
      this.overFlow,
      this.decorationThickness,
      this.decorationStyle,
      this.decoration});

  String text;
  Color? color;
  double? size;
  FontWeight? weight;
  TextAlign? align;
  int? maxLines;
  TextOverflow? overFlow;
  TextDecoration? decoration;
  double? decorationThickness;
  TextDecorationStyle? decorationStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: appTextStyleMedium(context,
          color: color,
          size: size ?? 16,
          weight: weight ?? FontWeight.w600,
          decoration: decoration,
          decorationThickness: decorationThickness,
          decorationStyle: decorationStyle),
      overflow: overFlow ?? TextOverflow.ellipsis,
      textAlign: align ?? TextAlign.left,
    );
  }
}

//ignore: must_be_immutable
class AppTextBold extends StatelessWidget {
  AppTextBold(
      {super.key,
      required this.text,
      this.color,
      this.size,
      this.weight,
      this.align,
      this.maxLines,
      this.overFlow,
      this.decorationThickness,
      this.decorationStyle,
      this.decoration});

  String text;
  Color? color;
  double? size;
  FontWeight? weight;
  TextAlign? align;
  int? maxLines;
  TextOverflow? overFlow;
  TextDecoration? decoration;
  double? decorationThickness;
  TextDecorationStyle? decorationStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: appTextStyleBold(context,
          color: color,
          size: size ?? 16,
          weight: weight ?? FontWeight.w600,
          decoration: decoration,
          decorationThickness: decorationThickness,
          decorationStyle: decorationStyle),
      overflow: overFlow ?? TextOverflow.ellipsis,
      textAlign: align ?? TextAlign.left,
    );
  }
}

class AppTextSemiBold extends StatelessWidget {
  AppTextSemiBold(
      {super.key,
      required this.text,
      this.color,
      this.size,
      this.weight,
      this.align,
      this.maxLines,
      this.overFlow,
      this.decorationThickness,
      this.decorationStyle,
      this.decoration});

  String text;
  Color? color;
  double? size;
  FontWeight? weight;
  TextAlign? align;
  int? maxLines;
  TextOverflow? overFlow;
  TextDecoration? decoration;
  double? decorationThickness;
  TextDecorationStyle? decorationStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: appTextStyleSemiBold(context,
          color: color,
          size: size ?? 20,
          weight: weight ?? FontWeight.w600,
          decoration: decoration,
          decorationThickness: decorationThickness,
          decorationStyle: decorationStyle),
      overflow: overFlow ?? TextOverflow.ellipsis,
      textAlign: align ?? TextAlign.left,
    );
  }
}

//ignore: must_be_immutable
class AppTextExtraLight extends StatelessWidget {
  AppTextExtraLight(
      {super.key,
      required this.text,
      this.color,
      this.size,
      this.weight,
      this.align,
      this.maxLines,
      this.overFlow,
      this.decorationThickness,
      this.decorationStyle,
      this.decoration});

  String text;
  Color? color;
  double? size;
  FontWeight? weight;
  TextAlign? align;
  int? maxLines;
  TextOverflow? overFlow;
  TextDecoration? decoration;
  double? decorationThickness;
  TextDecorationStyle? decorationStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: appTextStyleSemiBold(
        context,
        color: color,
        size: size ?? 16,
        weight: weight ?? FontWeight.w300,
        decorationThickness: decorationThickness,
        decorationStyle: decorationStyle,
      ),
      overflow: overFlow ?? TextOverflow.ellipsis,
      textAlign: align ?? TextAlign.left,
    );
  }
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


