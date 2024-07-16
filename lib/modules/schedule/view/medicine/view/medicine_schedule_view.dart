import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/config/theme/button_styles.dart';
import 'package:health_app/constant/assets_contant.dart';
import 'package:health_app/widget/app_button.dart';
import 'package:health_app/widget/app_scaffold.dart';
import '../../../../../widget/app_card.dart';
import '../../../controller/schedule_controller.dart';
import 'add_edit_medicine_view.dart';

class MedicineScheduleView extends StatelessWidget {
  MedicineScheduleView({super.key, required this.controller});

  ScheduleController controller;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: ListView.builder(
          itemCount: controller.medicineSchedulingList.length,
          itemBuilder: (context, index) {
            var model = controller.medicineSchedulingList[index];
            return MedicineScheduleCard(
              model: model,
              onEditClick: (){
                Get.to(()=>AddEditMedicineView(), arguments: {
                  'args' : model
                });
              },
              onDeleteClick: (){},
              onNotifyChanged: (value ) {  },
            );
          }),
      floatingButton: AppButton(
        title: 'Add',
        onPressed: () {
          Get.to(()=>AddEditMedicineView(), arguments: {
            'args' : null
          });
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
