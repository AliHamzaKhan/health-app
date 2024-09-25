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
      appBar: HaAppBar(
        appBarType: AppBarType.Menu,
        onMenuClick: () {
          controller.openDrawer();
        },
        titleWidget: appIconImage(size: Size(200, 200)),
      ),
      body: Column(
        children: [],
      ),
      drawer: AppDrawer(),
    );
  }
}
