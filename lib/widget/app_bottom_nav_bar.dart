import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/auth/auth_service.dart';
import '../config/size_config.dart';
import '../config/theme/app_colors.dart';
import '../config/theme/app_gradient.dart';
import '../constant/assets_contant.dart';

class AppBottomNavBar extends StatelessWidget {
  AppBottomNavBar(
      {super.key, required this.onNavSelected, required this.selectedNavType});

  Function(BottomNavType) onNavSelected;
  BottomNavType selectedNavType;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: setHeightValue(50),
      padding: EdgeInsets.symmetric(
          horizontal: setWidthValue(60), vertical: setHeightValue(15)),
      margin: EdgeInsets.symmetric(vertical: setHeightValue(10)),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(
            color: AppColors.borderColor,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: bottomNavBarList
            .map((e) => GestureDetector(
                  onTap: () {
                    onNavSelected(e.type);
                  },
                  child: Container(
                    padding: EdgeInsets.all(
                        setHeightValue(e.type == selectedNavType ? 15 : 10)),
                    decoration: BoxDecoration(
                      color: e.type == selectedNavType
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(setWidthValue(120)),
                      gradient: e.type == selectedNavType
                          ? createLinearGradient()
                          : null,
                    ),
                    child: Image.asset(
                      e.icon,
                      width: setWidthValue(e.type == selectedNavType ? 40 : 50),
                      height: setWidthValue(e.type == selectedNavType ? 40 : 50),
                      fit: BoxFit.contain,
                      color: e.type == selectedNavType
                          ? Theme.of(context).scaffoldBackgroundColor
                          : (Get.find<AuthService>().saveData.isDarkTheme() ?? false)
                              ? AppColors.accent
                              : AppDarkColors.accent,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
List<BottomNavModel> bottomNavBarList = [
  BottomNavModel(
      index: 1,
      icon: AssetsConstant.home,
      type: BottomNavType.Home,
      onClick: () {}),
  BottomNavModel(
      index: 2,
      icon: AssetsConstant.notification,
      type: BottomNavType.Schedule,
      onClick: () {}),
];

enum BottomNavType { Home, Schedule }

class BottomNavModel {
  int index;
  String icon;
  BottomNavType type;
  var onClick;

  BottomNavModel(
      {required this.index,
      required this.icon,
      required this.type,
      required this.onClick});
}
