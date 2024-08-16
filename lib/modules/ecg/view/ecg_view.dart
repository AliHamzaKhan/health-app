import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/widget/app_scaffold.dart';
import '../../../widget/app_camera.dart';
import '../controller/ecg_controller.dart';

class EcgView extends StatelessWidget {
  EcgView({super.key});

  var controller = Get.put(EcgController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: AppCamera(
        onImageClick: (file) {},
      ),
    );
  }
}
