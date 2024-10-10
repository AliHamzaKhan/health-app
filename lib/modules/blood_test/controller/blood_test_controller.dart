


import 'dart:io';

import 'package:get/get.dart';

import '../../../config/controllers/api_controller.dart';
import '../../../config/enums/ai_request_type_enum.dart';
import '../../../config/model/data_process_model.dart';
import '../../../config/routes/app_routes.dart';
import '../../../utils/app_print.dart';
import '../../../widget/app_loading.dart';

class BloodTestController extends GetxController{

  ApiController apiController = Get.find();
  late File file;
  DataProcessModel dataProcessModel = DataProcessModel.fromJson({});

  Future processData() async {
    try {
      await apiController
          .processData(image: file, requestType: AiRequestTypeEnum.bloodTest)
          .then((data) {
        appDebugPrint('data');
        appDebugPrint(data);
        dataProcessModel = data;
        appDebugPrint(dataProcessModel.toString());
        Get.toNamed(AppRoutes.aiProcess, arguments: {'args': dataProcessModel})?.then((value){
          file = File('');
        });
      });
    } catch (e) {
      AppLoader.dismiss();
    }
  }
}