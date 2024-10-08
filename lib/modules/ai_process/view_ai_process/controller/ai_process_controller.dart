


import 'package:get/get.dart';
import 'package:health_app/config/model/data_process_model.dart';

class AiProcessController extends GetxController{
  Rx<DataProcessModel> dataProcessModel = DataProcessModel.fromJson({}).obs;

  getData(){
    dataProcessModel(tempDataDataProcessModel);
  }
  @override
  void onInit() {
    super.onInit();
    getData();
  }
}