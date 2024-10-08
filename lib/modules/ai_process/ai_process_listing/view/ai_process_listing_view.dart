import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/widget/app_scaffold.dart';
import '../../../../config/model/data_process_model.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../widget/app_appbar.dart';
import '../../../../widget/app_card.dart';
import '../controller/ai_process_listing_controller.dart';

class AiProcessListingView extends StatelessWidget {
  AiProcessListingView({super.key});

  var controller = Get.put(AiProcessListingController());

  @override
  Widget build(BuildContext context) {

    return AppScaffold(
      appBar: HaAppBar(
        titleText: 'Data Processed',
        actionType: AppBarActionType.Custom,
      ),
      body: Obx(()=>controller.isDataLoaded.value ? ListView.builder(
          itemCount: controller.dataProcessList.length,
          itemBuilder: (context, index){
            var model = controller.dataProcessList[index];
            return DataProcessCard(
              model: model,
              onClick: (){
                Get.toNamed(
                  AppRoutes.aiProcess,
                  arguments: {
                    'args' : model
                  }
                )?.then((value){
                  controller.getDataProcess();
                });
              },
            );
          }) : Center(child: CircularProgressIndicator(),)),
    );
  }
}
