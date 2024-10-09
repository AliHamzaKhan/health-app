


import 'package:get/get.dart';
import 'package:health_app/config/controllers/api_controller.dart';
import 'package:health_app/config/model/user_profile_model.dart';
import 'package:health_app/utils/app_print.dart';

class ProfileController extends GetxController{

  ApiController apiController = Get.find();
  Rx<UserProfile> userProfile = UserProfile.fromJson({}).obs;
  var isProfileLoaded = false.obs;


 Future getUserProfile() async{
   isProfileLoaded(false);
    await apiController.getProfile().then((profile){
      userProfile(profile);
      appDebugPrint(userProfile.value.toString());
      isProfileLoaded(true);
    });
  }
  Future saveProfile() async{
   await apiController.saveProfile(profile: userProfile.value, callBack: (success){
     if(success){

     }
   });
  }

  @override
  void onInit() {
    super.onInit();
    getUserProfile();
  }
}