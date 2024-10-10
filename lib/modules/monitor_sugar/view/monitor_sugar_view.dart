import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/config/model/sugar_model.dart';
import 'package:health_app/config/services/data_parser_service.dart';
import 'package:health_app/config/size_config.dart';
import 'package:health_app/config/theme/button_styles.dart';
import 'package:health_app/utils/app_print.dart';
import 'package:health_app/widget/app_button.dart';
import 'package:health_app/widget/app_card.dart';
import 'package:health_app/widget/app_chips.dart';
import 'package:health_app/widget/app_input_field.dart';
import 'package:health_app/widget/app_scaffold.dart';
import 'package:health_app/widget/app_text.dart';
import '../../../constant/app_key_contant.dart';
import '../../../widget/app_alerts.dart';
import '../../../widget/app_appbar.dart';
import '../../../widget/app_dialogue.dart';
import '../../../widget/app_widgets.dart';
import '../controller/monitor_sugar_controller.dart';

class MonitorSugarView extends StatelessWidget {
  MonitorSugarView({super.key});

  var controller = Get.put(MonitorSugarController());

  @override
  Widget build(BuildContext context) {
    controller.getSugarData();
    return AppScaffold(
      appBar: HaAppBar(
        titleText: 'Monitor Sugar',
      ),
      body: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              10.height,
              AppButton(
                title: 'Add Sugar Details',
                onPressed: () {
                  addSugarDialogue(context, onAddClick: (glucoseType, value, date) {
                    SugarModel model = SugarModel.fromJson({});
                    model.sugarType = glucoseType.name;
                    model.totalSugar = value;
                    model.dateTime = date;
                    controller.addSugarData(model);
                    appDebugPrint('glucoseType : ${glucoseType} | value : $value | date : $date');
                  });
                },
                buttonStyleClass: ButtonStyleClass(
                    width: isTab() ? getMaxMobile() : (Get.width / 2)),
              ),
              Expanded(
                child: ListView.builder(
                  padding: appPadding,
                    itemCount: controller.sugarList.length,
                    itemBuilder: (context, index) {
                      var model = controller.sugarList[index];
                      return GestureDetector(
                        onTap: (){
                          controller.updateSugarData(model);
                        },
                        child: appCard(child: Column(
                          children: [
                            TitleSubTitleText(head: 'total Sugar'.toTitleCase(), title: model.totalSugar.toString()),
                            TitleSubTitleText(head: 'sugar Type'.toTitleCase(), title: model.sugarType),
                            TitleSubTitleText(head: 'date Time'.toTitleCase(), title: model.dateTime),
                          ],
                        )),
                      );
                    }),
              )
            ],
          )),
    );
  }
}
