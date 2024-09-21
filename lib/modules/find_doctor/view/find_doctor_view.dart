


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/widget/app_scaffold.dart';

import '../../../widget/app_appbar.dart';
import '../controller/find_doctor_controller.dart';

class FindDoctorView extends StatelessWidget {
  FindDoctorView({super.key});

  var controller = Get.put(FindDoctorController());
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: HaAppBar(
        titleText: 'Find Doctors',
      ),
    );
  }
}
