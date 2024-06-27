


import 'package:get/get.dart';

import '../controllers/api_controller.dart';

class InitialBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ApiController());
  }

}