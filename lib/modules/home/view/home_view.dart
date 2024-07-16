import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/constant/assets_contant.dart';
import 'package:health_app/widget/app_scaffold.dart';

import '../../../widget/app_appbar.dart';
import '../../../widget/app_bottom_nav_bar.dart';
import '../../../widget/app_drawer.dart';
import '../../../widget/app_widgets.dart';
import '../controller/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  var controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      scaffoldKey: controller.scaffoldKey,
      appBar: appBar(
        context,
        leadingType: LeadingType.Menu,
        onLeadingClick: (){
          controller.openDrawer();
        },
          titleWidget: setImage(
              image: AssetsConstant.appIconTransparent,
              height: 70,
              width: 70,
              fit: BoxFit.contain
          )),
      drawer: AppDrawer(),
    );
  }
}
