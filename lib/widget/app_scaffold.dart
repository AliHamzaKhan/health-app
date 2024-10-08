import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/constant/app_key_contant.dart';

//ignore: must_be_immutable
class AppScaffold extends StatelessWidget {
  AppScaffold(
      {super.key,
      this.body,
      this.bottomNavBar,
      this.floatingButton,
      this.appBar,
      this.appBarTitle,
      this.appBarLeading,
      this.appBarColor,
      this.backgroundColor,
      this.drawer,
      this.endDrawer,
      this.scaffoldKey,
      this.bodyColor,
      this.bodyPadding,
      this.allowCorners = true,
      this.resizeToAvoidBottomInset});

  PreferredSizeWidget? appBar;
  Widget? body;
  Widget? bottomNavBar;
  Widget? floatingButton;
  bool? resizeToAvoidBottomInset;
  Widget? appBarTitle;
  Widget? appBarLeading;
  Color? appBarColor;
  Color? backgroundColor;
  Color? bodyColor;
  Widget? drawer;
  Widget? endDrawer;
  var scaffoldKey;
  EdgeInsets? bodyPadding;
  bool allowCorners;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawerEnableOpenDragGesture: false,
        key: scaffoldKey,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        backgroundColor: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        appBar: appBar,
        body: isTab() ? tabBody() : body,
        bottomNavigationBar: bottomNavBar,
        floatingActionButton: floatingButton,
        drawer: isTab() ? null : drawer,
        endDrawer: isTab() ? null : endDrawer,
      ),
    );
  }

  tabBody() {
    return Container(
      width: Get.width,
      height: Get.height,
      child: Row(
        children: [
          (drawer ?? SizedBox()),
          (body ?? SizedBox()),
          (endDrawer ?? SizedBox()),
        ],
      ),
    );
  }
}
