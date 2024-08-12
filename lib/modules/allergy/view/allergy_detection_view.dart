import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/allergy_detection_controller.dart';

class AllergyDetectionView extends StatelessWidget {
  AllergyDetectionView({super.key});

  var controller = Get.put(AllergyDetectionController());

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
