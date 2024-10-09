


import 'package:get/get.dart';
import 'package:health_app/config/controllers/api_controller.dart';
import 'package:health_app/config/services/data_parser_service.dart';
import 'package:health_app/utils/app_print.dart';

import '../../../config/model/token_used_model.dart';

class TokensUsedController extends GetxController{

  ApiController apiController = Get.find();
  RxList<TokenUsedModel> tokensUsedList = <TokenUsedModel>[].obs;
  var totalUsedTokensCount = 0.obs;


  getUsedTokens() async{
    apiController.getUsedTokens().then((list){
      tokensUsedList.assignAll(list);
      appDebugPrint('tokensUsedList ${tokensUsedList.length}');
      totalUsedTokensCount(getTotalCount());
    });
  }

  int getTotalCount(){
    int count = 0;
    for(var a in tokensUsedList){
      count += a.tokenUsed;
    }
    return count;
  }
  @override
  void onInit() {
    super.onInit();
    getUsedTokens();
  }
}