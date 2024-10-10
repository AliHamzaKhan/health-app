import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/enums/ai_request_type_enum.dart';
import '../../../config/routes/app_routes.dart';
import '../../../widget/app_appbar.dart';
import '../../../widget/app_camera.dart';
import '../../../widget/app_scaffold.dart';
import '../controller/eeg_controller.dart';

class EegView extends StatelessWidget {
  EegView({super.key});

  var controller = Get.put(EegController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: HaAppBar(
        titleText: 'EEG Report',
        actionType: AppBarActionType.Ai,
        onActionClick: () {
          Get.toNamed(AppRoutes.aiProcessListing,
              arguments: {'args': AiRequestTypeEnum.eegReport});
        },
      ),
      body: AppCamera(
        onImageClick: (file) async {
          controller.file = file;
          await controller.processData();
        },
      ),
    );
  }
}
