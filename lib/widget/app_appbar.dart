import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/widget/app_text.dart';
import '../config/routes/app_routes.dart';
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

enum LeadingType { Menu, Back, Ai }

class HaAppBar extends StatelessWidget implements PreferredSizeWidget {
  HaAppBar({super.key,
    this.appBarType = AppBarType.Back,
    this.isFilter = false,
    this.onFilterClick,
    this.actionWidget,
    this.onBackPressed,
    this.onMenuClick,
    this.titleWidget,
    this.titleText = '',
    this.backgroundColor,
    this.appbarHeight = 70,
    this.actionType = AppBarActionType.Profile,
    this.onActionClick
  });

  AppBarType appBarType;
  bool isFilter;
  var onFilterClick;
  Widget? actionWidget;
  var onBackPressed;
  var onMenuClick;

  // var onProfileClick;
  Widget? titleWidget;
  String titleText;
  Color? backgroundColor;
  double appbarHeight;
  AppBarActionType actionType;
  var onActionClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: backgroundColor,
      padding: EdgeInsets.symmetric(
          horizontal: setWidthValue(30), vertical: setHeightValue(10)),
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
          (titleWidget ??
              AppText(
                title: titleText ?? '',
                textType: TextTypeEnum.Bold,
              )),

          if(actionType == AppBarActionType.Profile)...[
            AppIconButton(
              icon: AssetsConstant.profile,
              onTap: () {
                Get.toNamed(AppRoutes.profile);
              },
              width: 30,
              height: 30,
              iconSize: 18,
              iconColor: Theme
                  .of(context)
                  .scaffoldBackgroundColor,
            )
          ]
          else
            if(actionType == AppBarActionType.Ai)...[
              AppIconButton(
                icon: AssetsConstant.gallery,
                onTap: onActionClick,
                width: 30,
                height: 30,
                iconSize: 18,
                iconColor: Theme
                    .of(context)
                    .scaffoldBackgroundColor,
              )
            ]
            else
              if(actionType == AppBarActionType.Custom)...[
                setWidth(30)
                // AppIconButton(
                //   icon: AssetsConstant.profile,
                //   onTap: onActionClick,
                //   width: 30,
                //   height: 30,
                //   iconSize: 18,
                //   iconColor: Theme.of(context).scaffoldBackgroundColor,
                // )
              ]
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(200, appbarHeight);
}

enum AppBarType { Back, Home, Menu }

enum AppBarActionType { Profile, Ai, Custom }
