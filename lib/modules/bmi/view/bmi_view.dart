import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/app_camera.dart';
import '../../../widget/app_scaffold.dart';
import '../controller/bmi_controller.dart';

class BmiView extends StatelessWidget {
  BmiView({super.key});

  var controller = Get.put(BmiController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: AppCamera(
        onImageClick: (file) {},
      ),
    );
  }
}
