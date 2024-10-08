import 'package:get/get.dart';
import 'package:health_app/config/controllers/api_controller.dart';
import 'package:health_app/utils/app_print.dart';
import '../../../../config/enums/ai_request_type_enum.dart';
import '../../../../config/model/data_process_model.dart';

class AiProcessListingController extends GetxController {
  ApiController apiController = Get.find();
  RxList<DataProcessModel> dataProcessList = <DataProcessModel>[].obs;
  RxBool isDataLoaded = false.obs;
  AiRequestTypeEnum requestTypeEnum = AiRequestTypeEnum.none;

  getDataProcess() async {
    dataProcessList.clear();
    isDataLoaded(false);
    apiController.getProcessData(requestType: requestTypeEnum).then((list){
      dataProcessList.assignAll(list);
      appDebugPrint('dataProcessList ${dataProcessList.length}');
      isDataLoaded(true);
    });
  }
  getArgs(){
    requestTypeEnum = Get.arguments['args'] ?? AiRequestTypeEnum.none;
  }
  @override
  void onInit() {
    super.onInit();
    getArgs();
    getDataProcess();
  }
}
