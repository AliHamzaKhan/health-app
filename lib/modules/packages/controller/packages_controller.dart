


import 'package:get/get.dart';
import 'package:health_app/config/controllers/api_controller.dart';
import 'package:health_app/utils/app_print.dart';
import '../../../config/model/package_model.dart';

class PackagesController extends GetxController{

  ApiController apiController = Get.find();
  RxList<PackageModel> packagesList = <PackageModel>[].obs;
  var isPackagesLoaded = false.obs;

  getPackages() async{
    isPackagesLoaded(false);
    apiController.getPackages().then((list){
      packagesList.assignAll(list);
      appDebugPrint('packagesList ${packagesList.length}');
      isPackagesLoaded(true);
    });
  }
  @override
  void onInit() {
    super.onInit();
    getPackages();
  }
}