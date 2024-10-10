


import 'package:get/get.dart';
import 'package:health_app/config/controllers/api_controller.dart';
import 'package:health_app/utils/app_print.dart';

import '../../../config/model/user_type_model.dart';

class UserTypeController extends GetxController{
  ApiController apiController = Get.find();
  List<UserTypeModel> userTypeList = <UserTypeModel>[].obs;
  Rx<UserTypeModel> selectedUserType = UserTypeModel.fromJson({}).obs;

  getUserType() async{
    await apiController.getUserTypes().then((list){
      userTypeList.assignAll(list);
      if(userTypeList.isNotEmpty){
        selectedUserType(userTypeList.first);
      }
      appDebugPrint(list);
    });
  }

  @override
  void onInit() {
    super.onInit();
    getUserType();
  }
}