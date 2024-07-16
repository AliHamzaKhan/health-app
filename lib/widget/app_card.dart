import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:health_app/config/size_config.dart';
import 'package:health_app/config/theme/app_colors.dart';
import 'package:health_app/constant/assets_contant.dart';
import 'package:health_app/widget/app_button.dart';
import '../config/model/appointment_schedule_model.dart';
import '../config/model/medicine_schedule_model.dart';
import '../constant/app_key_contant.dart';
import 'app_checkbox.dart';
import 'app_text.dart';

class MedicineScheduleCard extends StatelessWidget {
  MedicineScheduleCard(
      {super.key,
      required this.model,
      required this.onEditClick,
      required this.onDeleteClick,
      required this.onNotifyChanged});

  MedicineScheduleModel model;
  Function onEditClick;
  Function onDeleteClick;
  Function(bool) onNotifyChanged;

  @override
  Widget build(BuildContext context) {
    return appCard(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  TitleSubTitleText(head: 'Medicine', title: 'Panadol'),
                  TitleSubTitleText(head: 'Timing', title: '2am'),
                  TitleSubTitleText(
                      head: 'Description', title: 'every 2 hours'),
                  setHeight(10),
                ],
              ),
            ),
            AppIconButton(icon: AssetsConstant.delete, onTap: onDeleteClick),
            AppIconButton(icon: AssetsConstant.edit, onTap: onEditClick),
          ],
        ),
        AppLabeledCheckbox(
          label: 'Notify Me',
          value: true,
          onChanged: onNotifyChanged,
          centerPadding: 10,
        ),
      ],
    ));
  }
}

class AppointmentScheduleCard extends StatelessWidget {
  AppointmentScheduleCard(
      {super.key,
      required this.model,
      required this.onDeleteClick,
      required this.onEditClick,
      required this.onNotifyChanged});

  AppointmentScheduleModel model;
  Function onEditClick;
  Function onDeleteClick;
  Function(bool) onNotifyChanged;

  @override
  Widget build(BuildContext context) {
    return appCard(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  TitleSubTitleText(head: 'Doctor', title: 'name'),
                  TitleSubTitleText(head: 'Hospital', title: 'name'),
                  TitleSubTitleText(head: 'Date', title: '2am'),
                  TitleSubTitleText(
                      head: 'Description', title: 'every 2 hours'),
                  TitleSubTitleText(
                      head: 'Hospital Address', title: 'every 2 hours'),
                  setHeight(10),
                ],
              ),
            ),
            AppIconButton(icon: AssetsConstant.delete, onTap: onDeleteClick),
            AppIconButton(icon: AssetsConstant.edit, onTap: onEditClick),
          ],
        ),
        AppLabeledCheckbox(
          label: 'Notify Me',
          value: true,
          onChanged: onNotifyChanged,
          centerPadding: 10,
        ),
      ],
    ));
  }
}

Widget appCard({required Widget child}) {
  return Container(
    width: Get.width,
    padding: EdgeInsets.symmetric(
        horizontal: setWidthValue(30), vertical: setHeightValue(10)),
    margin: EdgeInsets.symmetric(
        horizontal: setWidthValue(30), vertical: setHeightValue(10)),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizeConstant.kCardRadius),
        border: Border.all(color: AppColors.borderColor)),
    child: child,
  );
}
