import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/config/enums/ai_request_type_enum.dart';
import 'package:health_app/widget/app_scaffold.dart';
import '../../../config/routes/app_routes.dart';
import '../../../widget/app_appbar.dart';
import '../../../widget/app_camera.dart';
import '../controller/ecg_controller.dart';

class EcgView extends StatelessWidget {
  EcgView({super.key});

  var controller = Get.put(EcgController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: HaAppBar(
        titleText: 'ECG Reader',
        actionType: AppBarActionType.Ai,
        onActionClick: () {
          Get.toNamed(AppRoutes.aiProcessListing,
              arguments: {'args': AiRequestTypeEnum.ecgReport});
        },
      ),
      body: AppCamera(
        onImageClick: (file) async{
          controller.file = file;
          await controller.processData();
          // Get.toNamed(page)
        },
      ),
    );
  }
}
