import 'package:flutter/material.dart';

import '../config/size_config.dart';
import '../config/theme/app_colors.dart';
import 'app_text.dart';

//ignore: must_be_immutable
class AppLabeledCheckbox extends StatefulWidget {
  AppLabeledCheckbox(
      {Key? key,
      required this.label,
      required this.value,
      required this.onChanged,
      this.checkColor,
      this.labelSize,
      this.checkSize,
      this.scale,
      this.wrapCrossAlignment,
      this.centerPadding,
      this.direction,
      this.padding,
      this.horizontalPadding,
      this.iconRadius,
      this.overflow,
      this.textAlign,
      this.alignment})
      : super(key: key);

  final String label;
  bool value;
  final Function onChanged;
  Color? checkColor;
  WrapAlignment? alignment;
  double? labelSize;
  double? checkSize;
  double? scale;
  double? centerPadding;
  double? padding;
  double? horizontalPadding;
  double? iconRadius;
  WrapCrossAlignment? wrapCrossAlignment;
  Axis? direction;
  TextOverflow? overflow;
  TextAlign? textAlign;

  @override
  State<AppLabeledCheckbox> createState() => _AppLabeledCheckboxState();
}

class _AppLabeledCheckboxState extends State<AppLabeledCheckbox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: widget.padding ?? 0,
            horizontal: setWidthValue(widget.horizontalPadding ?? 0)),
        child: Wrap(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          direction: widget.direction ?? Axis.horizontal,
          crossAxisAlignment:
              widget.wrapCrossAlignment ?? WrapCrossAlignment.center,
          alignment: widget.alignment ?? WrapAlignment.center,
          // spacing: -10,
          children: <Widget>[
            SizedBox(
              height: setHeightValue(widget.checkSize ?? 24),
              width: setHeightValue(widget.checkSize ?? 24),
              child: Checkbox(
                value: widget.value,
                checkColor: widget.checkColor ?? AppColors.background,
                activeColor: AppColors.primary,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        setHeightValue(widget.iconRadius ?? 5))),
                onChanged: (bool? newValue) {
                  setState(() {
                    widget.value = newValue!;
                    widget.onChanged(newValue);
                  });
                },
              ),
            ),
            SizedBox(
              width: widget.centerPadding ?? 0,
            ),
            AppTextRegular(
              text: widget.label,
              color: AppColors.text,
              size: widget.labelSize ?? 14,
              overFlow: widget.overflow,
              align: widget.textAlign,
            )
          ],
        ),
      ),
    );
  }
}

//ignore: must_be_immutable
class PbLabelRadioButton extends StatefulWidget {
  PbLabelRadioButton(
      {Key? key,
      required this.label,
      required this.value,
      required this.onChanged,
      this.checkColor,
      this.textSize,
      this.radioSize,
      this.centerPadding,
      this.alignment})
      : super(key: key);

  final String label;
  bool value;
  final Function onChanged;
  Color? checkColor;
  WrapAlignment? alignment;
  double? textSize;
  double? radioSize;
  double? centerPadding;


  @override
  State<PbLabelRadioButton> createState() => _PbLabelRadioButtonState();
}

class _PbLabelRadioButtonState extends State<PbLabelRadioButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: Wrap(
        direction: Axis.horizontal,
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: widget.alignment ?? WrapAlignment.center,
        children: <Widget>[
          SizedBox(
            height: setHeightValue(widget.radioSize ?? 30),
            width: setHeightValue(widget.radioSize ?? 30),
            child: Radio(
                activeColor:
                    widget.checkColor ?? Theme.of(context).primaryColor,
                value: widget.value,
                groupValue: true,
                onChanged: (bool? newValue) {
                  setState(() {
                    widget.value = newValue!;
                    widget.onChanged(newValue);
                  });
                }),
          ),
          setWidth(widget.centerPadding ?? 5),
          AppTextRegular(
              text: widget.label,
              color: widget.checkColor ?? Theme.of(context).primaryColor,
              size: widget.textSize ?? 18),
        ],
      ),
    );
  }
}

//ignore: must_be_immutable
class CustomLabeledCheckbox extends StatefulWidget {
  final String label;
  bool value;
  final Function onChanged;
  Color? checkColor;
  Color? activeColor;
  WrapAlignment? alignment;
  double? labelSize;
  double? scale;
  double? centerPadding;
  double? padding;
  double? checkSize;
  double? horizontalPadding;
  MainAxisAlignment? mainAxisAlignment;
  Axis? direction;
  TextOverflow? overflow;
  TextAlign? textAlign;

  CustomLabeledCheckbox(
      {super.key,
      required this.label,
      required this.value,
      required this.onChanged,
      this.checkColor,
      this.activeColor,
      this.labelSize,
      this.checkSize,
      this.scale,
      this.mainAxisAlignment,
      this.centerPadding,
      this.direction,
      this.padding,
      this.horizontalPadding,
      this.overflow,
      this.textAlign,
      this.alignment});

  @override
  State<CustomLabeledCheckbox> createState() => _CustomLabeledCheckboxState();
}

class _CustomLabeledCheckboxState extends State<CustomLabeledCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: widget.padding ?? 0,
          horizontal: setWidthValue(widget.horizontalPadding ?? 0)),
      child: InkWell(
        onTap: () {
          widget.onChanged(!widget.value);
        },
        child: Row(
          mainAxisAlignment:
              widget.mainAxisAlignment ?? MainAxisAlignment.start,
          children: [
            SizedBox(
              height: setHeightValue(widget.checkSize ?? 24),
              width: setHeightValue(widget.checkSize ?? 24),
              child: Checkbox(
                visualDensity: VisualDensity.adaptivePlatformDensity,
                value: widget.value,
                checkColor: widget.checkColor ?? AppColors.background,
                activeColor: widget.activeColor ?? AppColors.primary,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: (bool? newValue) {
                  setState(() {
                    widget.value = newValue!;
                    widget.onChanged(newValue);
                  });
                },
              ),
            ),
            setWidth(widget.centerPadding ?? 0),
            Flexible(
              child: SingleChildScrollView(
                child: AppTextBold(
                  text: widget.label,
                  size: widget.labelSize ?? 16,
                  overFlow: widget.overflow,
                  align: widget.textAlign,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//ignore: must_be_immutable
class PbChips extends StatefulWidget {
  PbChips(
      {super.key,
      required this.label,
      required this.value,
      required this.onChange,
      this.padding});

  final String label;
  bool value;
  var onChange;
  var padding;

  @override
  State<PbChips> createState() => _PbChipsState();
}

class _PbChipsState extends State<PbChips> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.value = !widget.value;
          widget.onChange(widget.value);
        });
      },
      child: Chip(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(setHeightValue(20)),
            side: BorderSide(
                color: widget.value ? AppColors.primary : AppColors.accent)),
        side: BorderSide(
            color: widget.value ? AppColors.primary : AppColors.accent),
        shadowColor: Colors.transparent,
        elevation: 0,
        padding: widget.padding ?? EdgeInsets.zero,
        label: AppTextBold(
          text: widget.label,
          color: widget.value ? AppColors.background : AppColors.accent,
          size: 12,
        ),
        backgroundColor:
            widget.value ? AppColors.primary : AppColors.background,
      ),
    );
  }
}

//ignore: must_be_immutable
class AppCheckbox extends StatefulWidget {
  AppCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
    this.checkColor,
    this.labelSize,
    this.checkSize,
    this.padding,
    this.horizontalPadding,
    this.iconRadius,
  }) : super(key: key);

  bool value;
  final Function onChanged;
  Color? checkColor;
  double? labelSize;
  double? checkSize;
  double? padding;
  double? horizontalPadding;
  double? iconRadius;

  @override
  State<AppCheckbox> createState() => _AppCheckboxState();
}

class _AppCheckboxState extends State<AppCheckbox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: widget.padding ?? 0,
            horizontal: setWidthValue(widget.horizontalPadding ?? 0)),
        child: SizedBox(
          height: setHeightValue(widget.checkSize ?? 24),
          width: setHeightValue(widget.checkSize ?? 24),
          child: Checkbox(
            value: widget.value,
            checkColor: widget.checkColor ?? AppColors.background,
            activeColor: AppColors.primary,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    setHeightValue(widget.iconRadius ?? 5))),
            onChanged: (bool? newValue) {
              setState(() {
                widget.value = newValue!;
                widget.onChanged(newValue);
              });
            },
          ),
        ),
      ),
    );
  }
}
