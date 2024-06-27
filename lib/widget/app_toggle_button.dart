import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../config/theme/app_colors.dart';

//ignore: must_be_immutable
class AppSwitchButton extends StatefulWidget {
  AppSwitchButton({super.key,
    required this.value,
    required this.onChanged,
    this.height,
    this.width,
    this.size,
    this.radius,
    this.showOnOff = false,

  });

  final ValueChanged<bool> onChanged;
  bool value;
  bool showOnOff;
  double? width;
  double? height;
  double? radius;
  double? size;

  @override
  State<AppSwitchButton> createState() => _AppSwitchButtonState();
}

class _AppSwitchButtonState extends State<AppSwitchButton> {
  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      width: widget.width ?? 45.0,
      height: widget.height ?? 25.0,
      valueFontSize: 10.0,
      toggleSize: widget.size ?? 18.0,
      value: widget.value,
      borderRadius:widget.radius ?? 30.0,
      padding: 3,
      showOnOff: widget.showOnOff,
      onToggle: (value){
        setState(() {
          widget.value = ! widget.value;
          widget.onChanged(value);
        });
      },
      activeColor: AppColors.primary,
      inactiveColor: Colors.grey.shade300,
    );
  }
}
