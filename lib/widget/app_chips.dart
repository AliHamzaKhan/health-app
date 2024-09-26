import 'package:flutter/material.dart';
import '../config/size_config.dart';
import '../config/theme/app_colors.dart';
import 'app_text.dart';

//ignore: must_be_immutable
class AppChips extends StatefulWidget {
  AppChips(
      {super.key,
      required this.label,
      required this.value,
      required this.onTap,
      this.padding,
      this.borderRadius,
        this.fontSize
      });

  final String label;
  bool value;
  var onTap;
  EdgeInsets? padding;

  double? borderRadius;

  double? fontSize;
  @override
  State<AppChips> createState() => _PbChipsState();
}

class _PbChipsState extends State<AppChips> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.value = !widget.value;
          widget.onTap(widget.value);
        });
      },
      child: Chip(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(setHeightValue(widget.borderRadius ?? 20)),
            side: BorderSide(
                color: widget.value ? AppColors.primary : AppColors.accent)),
        side: BorderSide(
            color: widget.value ? AppColors.primary : AppColors.accent),
        shadowColor: Colors.transparent,
        elevation: 0,
        padding: widget.padding ?? EdgeInsets.zero,
        label: AppText(
          title: widget.label,
          color: widget.value ? AppColors.background : AppColors.primary,
          fontSize:widget.fontSize ??  12,
        ),
        backgroundColor:
            widget.value ? AppColors.primary : AppColors.background,
      ),
    );
  }
}

Widget chipWidget(context, {required String title, Color? color, double? borderRadius}) {
  return Chip(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(setHeightValue(borderRadius ?? 5)),
        side: BorderSide(color: color ?? Theme.of(context).primaryColor)),
    side: BorderSide(color: AppColors.accent),
    shadowColor: Colors.transparent,
    elevation: 0,
    padding: EdgeInsets.zero,
    labelPadding: EdgeInsets.symmetric(horizontal: setWidthValue(20)),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    label: AppText(
      title: title,
      color: Theme.of(context).scaffoldBackgroundColor,
      fontSize:8,
    ),
    backgroundColor: color ?? Theme.of(context).primaryColor,
  );
}

Widget appChip(context,
    {required String title,
    color,
    double? textSize,
    double? radius,
    onTap,
    EdgeInsets? margin,
    EdgeInsets? padding,
    TextAlign? textAlign,
    Widget? child}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: margin ??
          EdgeInsets.symmetric(
              horizontal: setWidthValue(30), vertical: setHeightValue(10)),
      padding: padding ??
          EdgeInsets.symmetric(
              horizontal: setWidthValue(20), vertical: setHeightValue(5)),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(setHeightValue(radius ?? 10)),
      ),
      child: child == null
          ? AppTextRegular(
              text: title,
              color: Theme.of(context).scaffoldBackgroundColor,
              size: textSize ?? 10,
              align: textAlign ?? TextAlign.center,
              overFlow: TextOverflow.clip,
            )
          : Row(
              children: [
                Expanded(
                  child: AppTextRegular(
                    text: title,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    size: textSize ?? 10,
                    align: textAlign ?? TextAlign.center,
                    overFlow: TextOverflow.clip,
                  ),
                ),
                child
              ],
            ),
    ),
  );
}
