


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/app_camera.dart';
import '../../../widget/app_scaffold.dart';
import '../controller/calories_controller.dart';

class CaloriesView extends StatelessWidget {
  CaloriesView({super.key});

  var controller = Get.put(CaloriesController());
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: AppCamera(
        onImageClick: (file) {},
      ),
    );
  }
}
