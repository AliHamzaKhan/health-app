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
        this.centerPadding = 5,
        this.direction,
        this.padding,
        this.horizontalPadding,
        this.iconRadius,
        this.overflow,
        this.textAlign,
        this.alignment,
        this.enable = true
      })
      : super(key: key);

  final String label;
  bool value;
  final Function onChanged;
  Color? checkColor;
  WrapAlignment? alignment;
  double? labelSize;
  double? checkSize;
  double? scale;
  double centerPadding;
  double? padding;
  double? horizontalPadding;
  double? iconRadius;
  WrapCrossAlignment? wrapCrossAlignment;
  Axis? direction;
  TextOverflow? overflow;
  TextAlign? textAlign;
  bool enable;

  @override
  State<AppLabeledCheckbox> createState() => _AppLabeledCheckboxState();
}

class _AppLabeledCheckboxState extends State<AppLabeledCheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if(widget.enable){
          setState(() {
            widget.value = !widget.value;
            widget.onChanged(widget.value);
          });
        }

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
                  side: BorderSide(
                    color: AppColors.background,
                  ),
                  borderRadius: BorderRadius.circular(
                      setHeightValue(widget.iconRadius ?? 5)),
                ),
                onChanged: (bool? newValue) {
                  if(widget.enable){
                    setState(() {
                      widget.value = !widget.value;
                      widget.onChanged(widget.value);
                    });
                  }
                },
              ),
            ),
            SizedBox(
              width: widget.centerPadding ?? 0,
            ),
            AppText(
              title: widget.label,
              color: AppColors.text,
              fontSize: widget.labelSize ?? 14,
              overflow: widget.overflow ?? TextOverflow.ellipsis,
              textAlign: widget.textAlign ?? TextAlign.left,
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
        setState(() {
          widget.value = !widget.value;
          widget.onChanged(widget.value);
        });
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
                  // setState(() {
                  //   widget.value = newValue!;
                  //   widget.onChanged(newValue);
                  // });
                }),
          ),
          setWidth(widget.centerPadding ?? 5),
          // AppTextRegular(
          //     text: widget.label,
          //     color: widget.checkColor ?? Theme.of(context).primaryColor,
          //     size: widget.textSize ?? 18),
          AppText(
            title: widget.label,
            color: AppColors.text,
            fontSize: widget.textSize ?? 14,
          )
        ],
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
        setState(() {
          widget.value = !widget.value;
          widget.onChanged(widget.value);
        });
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
              // setState(() {
              //   widget.value = newValue!;
              //   widget.onChanged(newValue);
              // });
            },
          ),
        ),
      ),
    );
  }
}
