import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/config/services/data_parser_service.dart';
import 'package:health_app/config/size_config.dart';
import 'package:health_app/config/theme/button_styles.dart';
import 'package:health_app/widget/app_button.dart';
import 'package:health_app/widget/app_chips.dart';
import 'package:health_app/widget/app_input_field.dart';
import 'package:health_app/widget/app_scaffold.dart';
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
    return AppScaffold(
      appBar: HaAppBar(
        titleText: 'Monitor Sugar',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          10.height,
          AppButton(
            title: 'Add Sugar Details',
            onPressed: () {
              addSugarDialogue(context, onAddClick: (glucoseType, value) {
                print('glucoseType : ${glucoseType} | value : $value');
              });
            },
            buttonStyleClass: ButtonStyleClass(
                width: isTab() ? getMaxMobile() : (Get.width / 2)),
          ),
          Container(
            width: Get.width,
          )
        ],
      ),
    );
  }
}

