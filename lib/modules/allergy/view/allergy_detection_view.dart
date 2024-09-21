import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/app_appbar.dart';
import '../../../widget/app_camera.dart';
import '../../../widget/app_scaffold.dart';
import '../controller/allergy_detection_controller.dart';

class AllergyDetectionView extends StatelessWidget {
  AllergyDetectionView({super.key});

  var controller = Get.put(AllergyDetectionController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: HaAppBar(
        titleText: 'Allergy Detection',
      ),
      body: AppCamera(
        onImageClick: (file) {},
      ),
    );
  }
}
