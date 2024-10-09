import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:health_app/widget/app_scaffold.dart';
import '../../../widget/app_appbar.dart';
import '../../../widget/app_card.dart';
import '../controller/packages_controller.dart';

class PackagesView extends StatelessWidget {
  PackagesView({super.key});

  var controller = Get.put(PackagesController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: HaAppBar(
        titleText: 'Packages',
      ),
      body: Obx(()=>ListView.builder(
          itemCount: controller.packagesList.length,
          itemBuilder: (context, index){
            var model = controller.packagesList[index];
            return PackageCard(model: model,);
          }))
    );
  }
}
