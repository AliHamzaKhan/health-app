import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:health_app/config/size_config.dart';
import 'package:health_app/config/theme/app_colors.dart';
import 'package:health_app/constant/assets_contant.dart';
import 'package:health_app/utils/app_print.dart';
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
                  TitleSubTitleText(
                      head: 'Medicine', title: model.medicineName),
                  TitleSubTitleText(head: 'Timing', title: model.description),
                  TitleSubTitleText(
                      head: 'Description',
                      title: formatTimingList(model.timing),
                      titleOverFlow: TextOverflow.clip,
                      titleMaxLines: 3),
                  setHeight(10),
                ],
              ),
            ),
            AppIconButton(
              icon: AssetsConstant.delete,
              onTap: onDeleteClick,
              btnColor: Colors.transparent,
            ),
            AppIconButton(
              icon: AssetsConstant.edit,
              onTap: onEditClick,
              btnColor: Colors.transparent,
            ),
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

  String formatTimingList(List<String> timingList) {
    // Create a map to group timings by day
    Map<String, List<String>> groupedTimings = {};

    // Group timings by day
    for (var timing in timingList) {
      print('Processing timing: $timing'); // Debug print

      // Use a regular expression to capture day and time properly
      var match =
          RegExp(r'(\w{3})\s+([\d:]+)\s+(AM|PM)').firstMatch(timing.trim());

      if (match != null) {
        String day = match.group(1)!; // Day (e.g., Thu)
        String time =
            match.group(2)! + ' ' + match.group(3)!; // Time (e.g., 01:00 PM)

        // Add the time to the appropriate day in the map
        if (!groupedTimings.containsKey(day)) {
          groupedTimings[day] = [];
        }
        groupedTimings[day]!.add(time);
      } else {
        // Debug print if the format is unexpected
        print('Unexpected format for timing: $timing');
      }
    }

    // Check if any timings were grouped
    if (groupedTimings.isEmpty) {
      return 'No timings available';
    }

    // Build the formatted string
    List<String> formattedList = [];
    groupedTimings.forEach((day, times) {
      // Join times with a comma
      String timeString = times.join(', ');
      formattedList.add('$day($timeString)'); // Format as "Day(Time1, Time2)"
    });

    // Join all day strings with a space
    return formattedList.join(' ');
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
                  TitleSubTitleText(head: 'Doctor', title: model.doctorName),
                  TitleSubTitleText(head: 'Hospital', title: model.hospitalName),
                  TitleSubTitleText(head: 'Date', title: model.date),
                  TitleSubTitleText(
                      head: 'Description', title: model.description),
                  TitleSubTitleText(
                      head: 'Hospital Address', title: model.address),
                  setHeight(10),
                ],
              ),
            ),
            AppIconButton(
              icon: AssetsConstant.delete,
              onTap: onDeleteClick,
              btnColor: Colors.transparent,
            ),
            AppIconButton(
              icon: AssetsConstant.edit,
              onTap: onEditClick,
              btnColor: Colors.transparent,
            ),
          ],
        ),
        AppLabeledCheckbox(
          label: 'Notify Me',
          value: model.notifyMe,
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
        border: Border.all(color: AppColors.borderColor.withOpacity(0.5))),
    child: child,
  );
}
