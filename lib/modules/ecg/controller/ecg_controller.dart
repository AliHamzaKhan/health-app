import 'dart:io';
import 'package:get/get.dart';
import 'package:health_app/config/controllers/api_controller.dart';
import 'package:health_app/config/enums/ai_request_type_enum.dart';
import 'package:health_app/config/model/data_process_model.dart';
import 'package:health_app/config/routes/app_routes.dart';
import 'package:health_app/utils/app_print.dart';
import 'package:health_app/widget/app_loading.dart';

class EcgController extends GetxController {
  ApiController apiController = Get.find();
  late File file;
  DataProcessModel dataProcessModel = DataProcessModel.fromJson({});

  Future processData() async {
    try {
      await apiController
          .processData(image: file, requestType: AiRequestTypeEnum.ecgReport)
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
