import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/modules/home/view/home_view.dart';

import '../../../widget/app_bottom_nav_bar.dart';
import '../../../widget/app_scaffold.dart';
import '../../schedule/view/schedule_view.dart';
import '../controller/app_controller.dart';

class AppView extends StatelessWidget {
  AppView({super.key});

  var controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: GetBuilder<AppController>(
        builder: (AppController controller) {
          return getPage();
        },
      ),
      bottomNavBar: GetBuilder<AppController>(
        builder: (AppController controller) {
          return AppBottomNavBar(
            onNavSelected: (type) {
              controller.selectedNavType(type);
              controller.update();
            },
            selectedNavType: controller.selectedNavType.value,
          );
        },
      ),
    );
  }

  getPage() {
    if (controller.selectedNavType.value == BottomNavType.Home) {
      return HomeView();
    } else if (controller.selectedNavType.value == BottomNavType.Schedule) {
      return ScheduleView();
    } else {
      return Container();
    }
  }
}
