import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/widget/app_text.dart';
import '../config/size_config.dart';
import '../constant/assets_contant.dart';
import 'app_button.dart';
import 'app_image.dart';

appBar(context, {
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
      color: color ?? Theme
          .of(context ?? Get.context)
          .scaffoldBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (leading ??
              (leadingType == LeadingType.Menu
                  ? AppIconButton(
                icon: AssetsConstant.menu,
                onTap: onLeadingClick,
                width: 35,
                height: 35,
                iconColor: Theme
                    .of(context)
                    .scaffoldBackgroundColor,
              )
                  : AppIconButton(
                icon: Icons.arrow_back,
                onTap: onLeadingClick ??
                        () {
                      Get.back();
                    },
                width: 35,
                height: 35,
                iconColor: Theme
                    .of(context)
                    .scaffoldBackgroundColor,
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
                width: 35,
                height: 35,
                iconColor: Theme
                    .of(context)
                    .scaffoldBackgroundColor,
              ))
        ],
      ),
    ),
  );
}

enum LeadingType { Menu, Back }

class HaAppBar extends StatelessWidget implements PreferredSizeWidget {
  HaAppBar({super.key,
    this.appBarType = AppBarType.Back,
    this.isFilter = false,
    this.onFilterClick,
    this.actionWidget,
    this.onBackPressed,
    this.onMenuClick,
    this.title,
    this.titleWidget,
    this.titleText = '',
    this.backgroundColor
  });

  AppBarType appBarType;
  bool isFilter;
  var onFilterClick;
  Widget? actionWidget;
  var onBackPressed;
  var onMenuClick;
  var onProfileClick;
  Widget? title;
  Widget? titleWidget;
  String titleText;
  Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: backgroundColor,
      padding: EdgeInsets.symmetric(
          horizontal: setWidthValue(30),
          vertical: setHeightValue(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (appBarType == AppBarType.Back) ...[
            AppIconButton(
              icon: Icons.arrow_back_outlined,
              onTap: onBackPressed ??
                      () {
                    Get.back();
                  },
              width: 30,
              height: 30,
              iconSize: 18,
              // iconColor: Theme.of(context).primaryColor,
            )
          ],
          if (appBarType == AppBarType.Menu) ...[
            AppIconButton(
              icon: AssetsConstant.menu,
              onTap: onMenuClick,
              width: 30,
              height: 30,
              iconSize: 18,
              iconColor: Theme
                  .of(context)
                  .scaffoldBackgroundColor,
            )
          ],
          (titleWidget ?? AppText(title: titleText ?? '', textType: TextTypeEnum.Bold,)),

          actionWidget ??

              AppIconButton(
                icon: AssetsConstant.profile,
                onTap: onProfileClick,
                width: 30,
                height: 30,
                iconSize: 18,
                iconColor: Theme.of(context).scaffoldBackgroundColor,
              )

        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(200, 50);
}

enum AppBarType { Back, Home, Menu }
