import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/size_config.dart';
import '../constant/assets_contant.dart';
import 'app_button.dart';

AppBar crAppBar(context,
    {Widget? leading,
    Widget? title,
    List<Widget>? actions,
    Color? appBarColor,
    bool? centerTitle}) {
  return AppBar(
    elevation: 0,
    backgroundColor:
        appBarColor ?? Theme.of(context).appBarTheme.backgroundColor,
    foregroundColor:
        appBarColor ?? Theme.of(context).appBarTheme.backgroundColor,
    leading: leading ??
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Theme.of(context).appBarTheme.iconTheme!.color,
            )),
    title: title,
    centerTitle: centerTitle ?? true,
    actions: actions,
  );
}

Widget appBar(

    {context,
      Widget? leading,
    Widget? title,
    Widget? action,
    Function? onLeadingClick,
    onActionClick,
    String? leadingIcon,
      String? actionIcon,
    LeadingType leadingType = LeadingType.Menu,
    Color? color
    }) {
  return Container(
    padding: EdgeInsets.all(setHeightValue(10)),
    color: color ?? Theme.of(context ?? Get.context).scaffoldBackgroundColor,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        (leading ??
            (leadingType == LeadingType.Menu
                ? AppIconButton(
                    icon: leadingIcon ?? AssetsConstant.menu,
                    onTap: onLeadingClick,
                    isShadow: true,
                    width: 35,
                    height: 35,
                  )
                : AppIconButton(
                    icon: leadingIcon ?? AssetsConstant.backArrow,
                    onTap: onLeadingClick ?? (){
                      Get.back();
                    },
                    isShadow: true,
                    width: 35,
                    height: 35,
                  ))),
        (title ??
            Image.asset(
              AssetsConstant.appImageNoText,
              width: setHeightValue(120),
              height: setHeightValue(52),
            )),
        (action ??
            AppIconButton(
              icon: actionIcon ?? AssetsConstant.search,
              onTap: onActionClick,
              isShadow: true,
              width: 35,
              height: 35,
            ))
      ],
    ),
  );
}

enum LeadingType { Menu, Back }
