import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../config/services/data_parser_service.dart';
import '../config/size_config.dart';
import '../config/theme/app_colors.dart';
import 'app_text.dart';

//ignore: must_be_immutable
class AppInputField extends StatefulWidget {
  AppInputField(
      {super.key,
      required this.hintText,
      required this.onChanged,
      this.controller,
      this.obSecureText,
      this.borderColor,
      this.textColor,
      this.hintTextColor,
      this.color,
      this.validator,
      this.onTap,
      this.keyboardType,
      this.onSubmitted,
      this.textSize,
      this.maxLines = 1,
      this.maxNum,
      this.height,
      this.minLength = 0,
      this.maxLength = 100,
      this.width,
      this.isBorder = true,
      this.compareWith,
      this.isRequired = true,
      this.removeSpecialCharacters = false,
      this.focusNode,
      this.prefixIcon,
      this.labelText,
      this.customBorderRadius,
      this.radius,
      this.padding,
      this.fontWeight,
      this.textCapitalization,
      this.suffixIcon,
      this.onSuffixClick,
      this.onSuffixTapClick,
      this.enable = true,
      this.isErrorBorderEnable = false,
      this.isSuffixIcon = false,
      this.isPrefixIcon = false,
      this.align,
      this.letterSpacing,
      this.wordSpacing});

  final String hintText;
  var onChanged;
  var onSubmitted;
  var validator;
  var onTap;

  final Color? borderColor;
  final Color? textColor;
  final Color? hintTextColor;
  final Color? color;
  final double? textSize;
  bool? obSecureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? compareWith;
  final int maxLines;
  final int? maxNum;
  final int minLength;
  final int maxLength;
  final double? height;
  final double? width;
  final double? radius;
  final bool isRequired;
  final bool isSuffixIcon;
  var suffixIcon;
  var onSuffixClick;
  var onSuffixTapClick;
  final BorderRadius? customBorderRadius;
  final bool isPrefixIcon;
  final Widget? prefixIcon;
  final TextAlign? align;
  final FocusNode? focusNode;
  final bool isBorder;
  final bool enable;
  final EdgeInsets? padding;
  final bool isErrorBorderEnable;
  final TextCapitalization? textCapitalization;
  final String? labelText;
  final bool removeSpecialCharacters;

  final FontWeight? fontWeight;

  double? letterSpacing;
  double? wordSpacing;

  @override
  State<AppInputField> createState() => _AppInputFieldState();
}

class _AppInputFieldState extends State<AppInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      enabled: widget.enable,
      focusNode: widget.focusNode ?? FocusNode(),
      onTap: widget.onTap,
      controller: widget.controller,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      validator: widget.validator ?? pbInputValidator,
      obscureText: widget.obSecureText ?? false,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      maxLines: widget.maxLines,
      textAlign: widget.align ?? TextAlign.left,
      cursorColor: Theme.of(context).primaryColor,
      inputFormatters: [
        LengthLimitingTextInputFormatter(widget.maxLength),
        if (widget.removeSpecialCharacters)
          FilteringTextInputFormatter.digitsOnly
      ],
      style: appTextStyleExtraLight(
        context,
        color: widget.textColor ?? Theme.of(context).textTheme.bodySmall!.color,
        size: widget.textSize ?? 18,
        letterSpacing:widget.letterSpacing,
      ),
      decoration: InputDecoration(

          // suffixIconConstraints: BoxConstraints(),
          // prefixIconConstraints: BoxConstraints(),
          labelStyle: appTextStyleExtraLight(
            context,
            color: widget.textColor ?? AppColors.accent,
            size: widget.textSize ?? 18,
          ),
          labelText: widget.labelText,
          suffixIcon: widget.isSuffixIcon
              ? GestureDetector(
                  onTapDown: widget.onSuffixTapClick,
                  onTap: widget.onSuffixClick ??
                      () {
                        setState(() {
                          widget.obSecureText = !widget.obSecureText!;
                        });
                      },
                  child: Icon(
                    widget.suffixIcon ??
                        (widget.obSecureText!
                            ? Icons.visibility
                            : Icons.visibility_off),
                    size: 18,
                    color: AppColors.accent,
                  ),
                )
              : null,
          prefixIcon: widget.prefixIcon,
          isDense: true,
          // contentPadding: EdgeInsets.symmetric(vertical: widget.padding ?? 0.0, horizontal: 10.0),
          contentPadding: widget.padding ??
              EdgeInsets.symmetric(
                  horizontal: setWidthValue(30), vertical: setHeightValue(15)),
          fillColor: widget.color ?? Theme.of(context).scaffoldBackgroundColor,
          hoverColor: widget.color ?? Theme.of(context).scaffoldBackgroundColor,
          filled: true,
          border: border(),
          focusedBorder: border(),
          enabledBorder: border(),
          disabledBorder: border(),
          errorBorder: widget.isErrorBorderEnable
              ? border()
              : OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(setHeightValue(widget.radius ?? 5)),
                  borderSide: BorderSide(
                      color: AppColors.danger.withOpacity(0.5),
                      width: setHeightValue(1))),
          focusedErrorBorder: border(),
          hintText: widget.hintText,
          hintStyle: appTextStyleExtraLight(
            context,
            color: widget.hintTextColor ?? AppColors.accent,
            size: widget.textSize ?? 18,
          )),
    );
  }

  border() {
    if (widget.isBorder) {
      return OutlineInputBorder(
          borderRadius: widget.customBorderRadius ??
              BorderRadius.circular(setHeightValue(widget.radius ?? 10)),
          borderSide: BorderSide(
              color: widget.borderColor ?? AppColors.borderColor,
              width: setHeightValue(1)));
    } else {
      return OutlineInputBorder(
          borderRadius: widget.customBorderRadius ??
              BorderRadius.circular(setHeightValue(widget.radius ?? 10)),
          borderSide:
              BorderSide(color: Colors.transparent, width: setHeightValue(1)));
    }
  }

  String? pbInputValidator(String? value) {
    if (value == null) {
      return null;
    }
    if (widget.isRequired && value.isEmpty) {
      return '${widget.hintText.toLowerCase()} required';
    }
    if (widget.minLength > 0) {
      return InputValidation().validateMin(value, widget.minLength);
    }
    if (widget.keyboardType == TextInputType.emailAddress) {
      return InputValidation().validateEmail(value, label: widget.hintText);
    }
    if (widget.keyboardType == TextInputType.name) {
      return InputValidation().validateName(value, label: widget.hintText);
    }
    if (widget.keyboardType == TextInputType.phone) {
      return InputValidation().validatePhoneNo(value, label: widget.hintText);
    }

    if (widget.obSecureText != null) {
      if (widget.compareWith != null) {
        return InputValidation().validateConfirmPassword(
            value, widget.compareWith,
            label: widget.hintText, otherLabel: "Password");
      } else {
        return InputValidation()
            .validatePassword(value, label: widget.hintText);
      }
    }

    return null;
  }
}

Widget appInputWithCustomLabel({
  onChanged,
  TextEditingController? controller,
  FocusNode? focusNode,
  TextInputType? keyboardType,
  int? maxLines,
  required String label,
  bool enable = true,
  double height = 1,
  bool showTitle = true,
  EdgeInsets? margin,
}) {
  return Container(
    // padding: EdgeInsets.symmetric(horizontal: setWidthValue(30)),
    margin: margin ?? EdgeInsets.symmetric(vertical: setHeightValue(5)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle)
          AppTextRegular(
            text: '*$label',
            size: 12,
          ),
        setHeight(height),
        AppInputField(
          enable: enable,
          radius: 20,
          hintText: label,
          onChanged: onChanged,
          controller: controller,
          focusNode: focusNode,
          keyboardType: keyboardType,
          textSize: 14,
          maxLines: maxLines ?? 1,
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 7.5),
        ),
      ],
    ),
  );
}
