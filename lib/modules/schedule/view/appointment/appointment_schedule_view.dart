import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/widget/app_scaffold.dart';
import '../../../../config/theme/button_styles.dart';
import '../../../../constant/assets_contant.dart';
import '../../../../widget/app_button.dart';
import '../../../../widget/app_card.dart';
import '../../controller/schedule_controller.dart';
import 'add_edit_appointment_view.dart';

class AppointmentScheduleView extends StatelessWidget {
  AppointmentScheduleView({super.key, required this.controller});

  ScheduleController controller;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: ListView.builder(
          itemCount: controller.appointmentSchedulingList.length,
          itemBuilder: (context, index) {
            var model = controller.appointmentSchedulingList[index];
            return AppointmentScheduleCard(
              model: model,
              onDeleteClick: () {},
              onEditClick: () {
                Get.to(() => AddEditAppointmentView(),
                    arguments: {'args': model});
              },
              onNotifyChanged: (value) {},
            );
          }),
      floatingButton: AppButton(
        title: 'Add',
        onPressed: () {
          Get.to(() => AddEditAppointmentView(), arguments: {'args': null});
        },
        buttonType: ButtonType.Floating,
        icon: AssetsConstant.add,
        buttonStyleClass: ButtonStyleClass(
            backgroundColor: Theme.of(context).primaryColor,
            iconColor: Theme.of(context).scaffoldBackgroundColor,
            height: 25),
      ),
    );
  }
}
