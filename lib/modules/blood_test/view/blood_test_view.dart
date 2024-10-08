


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../config/enums/ai_request_type_enum.dart';
import '../../../config/routes/app_routes.dart';
import '../../../widget/app_appbar.dart';
import '../../../widget/app_camera.dart';
import '../../../widget/app_scaffold.dart';
import '../controller/blood_test_controller.dart';

class BloodTestView extends StatelessWidget {
  BloodTestView({super.key});

  var controller = Get.put(BloodTestController());
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: HaAppBar(
        titleText: 'Blood Test',
        actionType: AppBarActionType.Ai,
        onActionClick: () {
          Get.toNamed(AppRoutes.aiProcessListing,
              arguments: {'args': AiRequestTypeEnum.bloodTest});
        },
      ),
      body: AppCamera(
        onImageClick: (file) {},
      ),
    );
  }
}
