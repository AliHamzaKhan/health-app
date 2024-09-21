


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widget/app_appbar.dart';
import '../../../widget/app_camera.dart';
import '../../../widget/app_scaffold.dart';
import '../controller/radiology_controller.dart';

class RadiologyView extends StatelessWidget {
  RadiologyView({super.key});

  var controller = Get.put(RadiologyController());
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: HaAppBar(
        titleText: 'Radiology Report',
      ),
      body: AppCamera(
        onImageClick: (file) {},
      ),
    );
  }
}
