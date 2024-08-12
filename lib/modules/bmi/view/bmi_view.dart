import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/bmi_controller.dart';

class BmiView extends StatelessWidget {
  BmiView({super.key});

  var controller = Get.put(BmiController());

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
