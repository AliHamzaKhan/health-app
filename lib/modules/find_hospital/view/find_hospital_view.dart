


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/widget/app_scaffold.dart';

import '../../../widget/app_appbar.dart';
import '../controller/find_hospital_controller.dart';

class FindHospitalView extends StatelessWidget {
  FindHospitalView({super.key});

  var controller = Get.put(FindHospitalController());
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: HaAppBar(
        titleText: 'Find Hospitals',
      ),
    );
  }
}
