import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/config/model/medicine_schedule_model.dart';
import 'package:health_app/config/theme/button_styles.dart';
import 'package:health_app/utils/app_print.dart';
import 'package:health_app/widget/app_alerts.dart';
import 'package:health_app/widget/app_chips.dart';
import 'package:health_app/widget/app_scaffold.dart';
import 'package:health_app/widget/app_text.dart';
import 'package:health_app/widget/app_widgets.dart';
import '../../../../../config/size_config.dart';
import '../../../../../config/theme/app_colors.dart';
import '../../../../../constant/app_key_contant.dart';
import '../../../../../utils/date_selection.dart';
import '../../../../../widget/app_appbar.dart';
import '../../../../../widget/app_button.dart';
import '../../../../../widget/app_checkbox.dart';
import '../../../../../widget/app_dialogue.dart';
import '../../../../../widget/app_input_field.dart';
import '../controller/add_edit_medicine_controller.dart';

class AddEditMedicineView extends StatelessWidget {
  AddEditMedicineView({super.key});

  var controller = Get.put(AddEditMedicineController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: HaAppBar(
        titleText: 'Add Medicine',
      ),

      // appBar(context, titleText: 'Add Medicine'),
      body: Obx(() => Padding(
            padding: const EdgeInsets.all(AppSizeConstant.kPadding),
            child: Column(
              children: [
                AppInputField(
                  hintText: 'Medicine Name',
                  onChanged: (value) {
                    controller.model.value.medicineName = value;
                  },
                  labelText: 'Medicine Name',
                  controller: TextEditingController(
                      text: controller.model.value.medicineName),
                ),
                10.height,
                AppInputField(
                  hintText: 'Description',
                  onChanged: (value) {
                    controller.model.value.description = value;
                  },
                  labelText: 'Description',
                  controller: TextEditingController(
                      text: controller.model.value.description),
                  maxLines: 3,
                ),
                10.height,
                AppLabeledCheckbox(
                  label: 'Notify Me',
                  value: controller.model.value.notifyMe,
                  onChanged: (value) {
                    controller.model.value.notifyMe = value;
                  },
                  centerPadding: 10,
                ),
                20.height,
                AppButton(
                    title: 'Add Time',
                    onPressed: () {
                      showAddTimeToMedicine(
                        context,
                        selectedTimeDates: controller.model.value.timing,
                        onAddClick: (List<String> times) {
                          controller.model.value.timing = times;
                          controller.model.refresh();
                          appDebugPrint(times);
                        },
                      );
                    },
                    buttonStyleClass: ButtonStyleClass(width: 100, height: 40)),
                if (controller.model.value.timing.isNotEmpty) ...[
                  getMapDatesListview()
                ],
                // const Spacer(),
                AppButton(title: 'Save', onPressed: () async {
                  if(controller.model.value.isMedicineEmpty()){
                    appAlerts.customAlert(
                      title: 'Error',
                      subTitle: 'Please fill add fields'
                    );
                  }
                  else{
                    controller.addMedicine();
                  }

                }),
                setHeight(20),
              ],
            ),
          )),
    );
  }

  getMapDatesListview() {
    var data = controller.groupTimesByDay(controller.model.value.timing);
    return Expanded(
      child: ListView.builder(
        itemCount: daysOfWeek.length,
        itemBuilder: (context, index) {
          String day = daysOfWeek[index];
          List<String> times = data[day] ?? [];
          return times.isNotEmpty ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title: day,
                textType: TextTypeEnum.Bold,
                fontSize: 13,
              ),
              Wrap(
                spacing: 8,
                children: times.map((time) {
                  return chipWidget(context, 
                      title: time, 
                      borderRadius : 20,
                      color : AppColors.secondary
                  );
                }).toList(),
              ),
            ],
          ) : SizedBox();
        },
      ),
    );
  }
}
