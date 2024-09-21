


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widget/app_appbar.dart';
import '../../../widget/app_camera.dart';
import '../../../widget/app_scaffold.dart';
import '../controller/medicine_controller.dart';

class MedicineView extends StatelessWidget {
  MedicineView({super.key});

  var controller = Get.put(MedicineController());
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: HaAppBar(
        titleText: 'Find Medicines',
      ),

    );
  }
}
