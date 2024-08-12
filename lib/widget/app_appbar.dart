import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/widget/app_text.dart';

import '../config/size_config.dart';
import '../constant/assets_contant.dart';
import 'app_button.dart';

appBar(
  context, {
  Widget? leading,
  Widget? titleWidget,
  Widget? action,
  Function? onLeadingClick,
  onActionClick,
  String? leadingIcon,
  String? actionIcon,
  LeadingType leadingType = LeadingType.Back,
  Color? color,
  String? titleText,
}) {
  return PreferredSize(
    preferredSize: Size(100, 70),
    child: Container(
      padding: EdgeInsets.all(setHeightValue(10)),
      color: color ?? Theme.of(context ?? Get.context).scaffoldBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (leading ??
              (leadingType == LeadingType.Menu
                  ? AppIconButton(
                      icon: AssetsConstant.menu,
                      onTap: onLeadingClick,
                      isShadow: true,
                      width: 35,
                      height: 35,
                    )
                  : AppIconButton(
                      icon: Icons.arrow_back,
                      onTap: onLeadingClick ??
                          () {
                            Get.back();
                          },
                      isShadow: true,
                      width: 35,
                      height: 35,
                    ))),
          (titleWidget ?? AppText(title: titleText ?? '')),
          // Image.asset(
          //   AssetsConstant.appIconTransparent,
          //   width: setHeightValue(120),
          //   height: setHeightValue(52),
          // )),
          (action ??
              AppIconButton(
                icon: actionIcon,
                onTap: onActionClick,
                isShadow: true,
                width: 35,
                height: 35,
              ))
        ],
      ),
    ),
  );
}

enum LeadingType { Menu, Back }

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget{
  const BasicAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar();
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
