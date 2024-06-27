

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
class HomeView extends StatelessWidget {
   HomeView({super.key});

   var controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
