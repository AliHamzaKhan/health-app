


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/widget/app_scaffold.dart';
import '../../../widget/app_appbar.dart';
import '../controller/monitor_sugar_controller.dart';

class MonitorSugarView extends StatelessWidget {
  MonitorSugarView({super.key});

  var controller = Get.put(MonitorSugarController());
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: HaAppBar(
        titleText: 'Monitor Sugar',
      ),
    );
  }
}
