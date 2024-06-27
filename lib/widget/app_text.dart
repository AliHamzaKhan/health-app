import 'package:flutter/material.dart';
import '../config/size_config.dart';
import '../config/theme/app_colors.dart';

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

appTextStyleRegular(
  context, {
  Color? color,
  double? size,
  FontWeight? weight,
  double? tabSize,
  TextDecoration? decoration,
  TextOverflow? overFlow,
  double? decorationThickness,
  TextDecorationStyle? decorationStyle,
      double? letterSpacing
}) {
  return Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: color,
        fontSize: size,
        fontWeight: weight ?? FontWeight.w600,
        overflow: overFlow ?? TextOverflow.ellipsis,
        decoration: decoration ?? TextDecoration.none,
        decorationColor: color ?? AppColors.text,
        decorationThickness: decorationThickness,
        decorationStyle: decorationStyle ?? TextDecorationStyle.solid,
      letterSpacing: letterSpacing
      );
}

appTextStyleMedium(
  context, {
  Color? color,
  double? size,
  FontWeight? weight,
  double? tabSize,
  TextDecoration? decoration,
  TextOverflow? overFlow,
  double? decorationThickness,
  TextDecorationStyle? decorationStyle,
      double? letterSpacing
}) {
  return Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: color,
        fontSize: size,
        fontWeight: weight ?? FontWeight.w700,
        overflow: overFlow ?? TextOverflow.ellipsis,
        decoration: decoration ?? TextDecoration.none,
        decorationColor: color ?? AppColors.text,
        decorationThickness: decorationThickness,
        decorationStyle: decorationStyle ?? TextDecorationStyle.solid,
      letterSpacing: letterSpacing
      );
}

appTextStyleBold(
  context, {
  Color? color,
  Color? decorationColor,
  double? size,
  FontWeight? weight,
  double? tabSize,
  TextDecoration? decoration,
  TextOverflow? overFlow,
  double? decorationThickness,
  TextDecorationStyle? decorationStyle,
      double? letterSpacing
}) {
  return Theme.of(context).textTheme.titleMedium!.copyWith(
        color: color,
        fontSize: size,
        fontWeight: weight ?? FontWeight.w900,
        overflow: overFlow ?? TextOverflow.ellipsis,
        decoration: decoration ?? TextDecoration.none,
        decorationColor: color ?? AppColors.text,
        decorationThickness: decorationThickness,
        decorationStyle: decorationStyle ?? TextDecorationStyle.solid,
      letterSpacing: letterSpacing
      );
}

appTextStyleExtraLight(
  context, {
  Color? color,
  double? size,
  FontWeight? weight,
  double? tabSize,
  TextDecoration? decoration,
  TextOverflow? overFlow,
  double? decorationThickness,
  TextDecorationStyle? decorationStyle,
      double? letterSpacing
}) {
  return Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: color,
        fontSize: size,
        fontWeight: weight ?? FontWeight.w300,
        overflow: overFlow ?? TextOverflow.ellipsis,
        decoration: decoration ?? TextDecoration.none,
        decorationColor: color ?? AppColors.text,
        decorationThickness: decorationThickness,
        decorationStyle: decorationStyle ?? TextDecorationStyle.solid,
      letterSpacing:letterSpacing
      );
}

appTextStyleSemiBold(
  context, {
  Color? color,
  double? size,
  FontWeight? weight,
  double? tabSize,
  TextDecoration? decoration,
  TextOverflow? overFlow,
  double? decorationThickness,
  TextDecorationStyle? decorationStyle,
      double? letterSpacing
}) {
  return Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: color,
        fontSize: size,
        fontWeight: weight ?? FontWeight.w800,
        overflow: overFlow ?? TextOverflow.ellipsis,
        decoration: decoration ?? TextDecoration.none,
        decorationColor: color ?? AppColors.text,
        decorationThickness: decorationThickness,
        decorationStyle: decorationStyle ?? TextDecorationStyle.solid,
        letterSpacing: letterSpacing
      );
}

Widget TitleSubTitleText({
  required String head,
  required String title,
  maxLines,
  CrossAxisAlignment? crossAxisAlignment,
  int? headFlex,
  Color? titleColor,
  Color? headColor,
  MainAxisAlignment? mainAxisAlignment,
  TextAlign? align,
}) {
  return Row(
    mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
    crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
    children: [
      AppTextExtraLight(
        text: head,
        size: 14,
        color: headColor,
        align: TextAlign.left,
      ),
      setWidth(10),
      Expanded(
          child: AppTextMedium(
        text: title,
        size: 14,
        align: align ?? TextAlign.end,
        color: titleColor,
        maxLines: maxLines,
        overFlow: TextOverflow.clip,
      ))
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
    TextAlign? titleTextAlign
    }) {
  return Column(
    mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
    crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
    children: [
      AppTextExtraLight(
        text: head,
        size: headeSize ?? 14,
        // color: AppColors.text2,
        align: TextAlign.left,
      ),
      setHeight(midPadding),
      AppTextRegular(
        text: title,
        size: titleSize ?? 14,
        align:titleTextAlign ?? TextAlign.start,
        color: titleColor,
        maxLines: maxLines,
        overFlow: TextOverflow.clip,
        weight: weight,
      )
    ],
  );
}
