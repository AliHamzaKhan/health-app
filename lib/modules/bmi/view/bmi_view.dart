import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/config/services/data_parser_service.dart';
import 'package:health_app/config/size_config.dart';
import 'package:health_app/widget/app_button.dart';
import 'package:health_app/widget/app_dropdown.dart';
import 'package:health_app/widget/app_input_field.dart';
import 'package:health_app/widget/app_text.dart';
import '../../../widget/app_appbar.dart';
import '../../../widget/app_scaffold.dart';
import '../controller/bmi_controller.dart';

class BmiView extends StatelessWidget {
  BmiView({super.key});

  var controller = Get.put(BmiController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: HaAppBar(
        titleText: 'BMI Calculator',
      ),
      body: Obx(() => Padding(
        padding: EdgeInsets.all(setWidthValue(30)),
        child: Column(
              children: [
                setHeight(20),
                Row(
                  children: [
                    Expanded(
                      child: appDropDownWithCustomLabel(
                          label: 'Weigh Unit',
                          items: controller.weightUnitList,
                          value: controller.weightUnit.value,
                          onSelected: (value) {
                            controller.weightUnit(value);
                          }),
                    ),
                    setWidth(10),
                    Expanded(
                      child: appInputWithCustomLabel(
                          label: 'Weight',
                          onChanged: (value) {
                            controller.updateWeight(
                                controller.weightUnit.value, dataParser.getDouble(value));
                          }),
                    )
                  ],
                ),
                setHeight(10),
                Row(
                  children: [
                    Expanded(
                      child: appDropDownWithCustomLabel(
                          label: 'Height Unit',
                          items: controller.heightUnitList,
                          value: controller.heightUnit.value,
                          onSelected: (value) {
                            controller.heightUnit(value);
                          }),
                    ),
                    setWidth(10),
                    Expanded(
                      child: appInputWithCustomLabel(
                          label: 'Height',
                          onChanged: (value) {
                            controller.updateHeight(
                                controller.heightUnit.value, value);
                          }),
                    )
                  ],
                ),
                setHeight(20),
                AppButton(title: 'Check', onPressed: () {
                  if(controller.heightCm > 0.0 && controller.weightKg > 0.0){
                    controller.calculateBMI();
                  }else{
                    Get.snackbar('Error', 'please select all values',);
                  }
                  
                }),
                setHeight(30),
                if(controller.bmi.value > 0.0)...[
                  AppText(title: 'Your BMI: ${controller.bmi.toStringAsFixed(2)}'),
                  setHeight(20),
                  LinearProgressIndicator(
                    value: controller.bmi / 40, // Normalize BMI to 0-1 range (assuming max BMI of 40)
                    valueColor: AlwaysStoppedAnimation<Color>(controller.getBMIcolor()),
                    backgroundColor: Colors.grey[300],
                  ),
                ]
              ],
            ),
      )),
    );
  }
// controller.updateHeight(
// controller.heightUnit.value,
// feet: double.parse(feetValue),
// inches: double.parse(inchesValue),
// );
}
