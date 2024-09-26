import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/config/services/date_parser_service.dart';
import 'package:health_app/config/size_config.dart';
import 'package:health_app/constant/app_key_contant.dart';
import 'package:health_app/widget/app_appbar.dart';
import 'package:health_app/widget/app_button.dart';
import 'package:health_app/widget/app_input_field.dart';
import 'package:health_app/widget/app_scaffold.dart';
import 'package:health_app/widget/app_text.dart';
import '../../../../../utils/date_selection.dart';
import '../../../../../widget/app_alerts.dart';
import '../../../../../widget/app_checkbox.dart';
import '../controller/add_edit_appointment_controller.dart';

class AddEditAppointmentView extends StatelessWidget {
  AddEditAppointmentView({super.key});

  var controller = Get.put(AddEditAppointmentController());
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar(context, titleText: 'Add Appointment'),
      body: Obx(()=>Padding(
        padding: const EdgeInsets.all(AppSizeConstant.kPadding),
        child: Column(
          children: [
            AppInputField(
              hintText: 'Doctor Name',
              onChanged: (value) {
                controller.model.value.doctorName = value;
              },
              labelText: 'Doctor Name',
              controller: TextEditingController(text: controller.model.value.doctorName),
            ),
            setHeight(10),
            AppInputField(
              hintText: 'Hospital',
              onChanged: (value) {
                controller.model.value.hospitalName = value;
              },
              labelText: 'Hospital Name',
              controller: TextEditingController(text: controller.model.value.hospitalName),
            ),
            setHeight(10),
            AppInputField(
              hintText: 'Description',
              onChanged: (value) {
                controller.model.value.description = value;
              },
              labelText: 'Description',
              maxLines: 3,
              controller: TextEditingController(text: controller.model.value.description),
            ),
            setHeight(10),
            AppInputField(
              hintText: 'Hospital Address',
              onChanged: (value) {
                controller.model.value.address = value;
              },
              labelText: 'Address',
              controller: TextEditingController(text: controller.model.value.address),
            ),
            setHeight(10),
            GestureDetector(
              onTap: () async {
                DateTime? pickedDateTime = await pickDateTime(context);
                if (pickedDateTime != null) {
                  controller.model.value.date = dateTimeParserService.getFormattedDate(pickedDateTime, format: "EEE MM dd yyyy");
                  print('Selected DateTime: $pickedDateTime');
                  controller.model.refresh();
                }
              },
              child: AppInputField(
                hintText: 'Appointment Date',
                onChanged: (value) {},
                labelText: controller.model.value.date.isNotEmpty ? controller.model.value.date : 'Appointment Date',
                enable: false,
                controller: TextEditingController(text: controller.model.value.date),
              ),
            ),
            setHeight(10),
            AppLabeledCheckbox(
              label: 'Notify Me',
              value: controller.model.value.notifyMe,
              onChanged: (value) {
                controller.model.value.notifyMe = value;
              },
              centerPadding: 10,
            ),
            Spacer(),
            AppButton(title: 'Save', onPressed: () {
              if(controller.model.value.isAppointmentEmpty()){
                appAlerts.customAlert(
                    title: 'Error',
                    subTitle: 'Please fill add fields'
                );
              }
              else{
                controller.addAppointment();
              }

            }),
            setHeight(20),
          ],
        ),
      )),
    );
  }
}
