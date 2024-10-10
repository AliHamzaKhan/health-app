import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:health_app/config/model/data_process_model.dart';
import 'package:health_app/config/model/package_model.dart';
import 'package:health_app/config/services/data_parser_service.dart';
import 'package:health_app/config/services/date_parser_service.dart';
import 'package:health_app/config/size_config.dart';
import 'package:health_app/config/theme/app_colors.dart';
import 'package:health_app/constant/assets_contant.dart';
import 'package:health_app/utils/app_print.dart';
import 'package:health_app/widget/app_button.dart';
import 'package:health_app/widget/app_image.dart';
import 'package:health_app/widget/app_widgets.dart';
import '../config/enums/user_type_enum.dart';
import '../config/model/appointment_schedule_model.dart';
import '../config/model/medicine_schedule_model.dart';
import '../config/model/token_used_model.dart';
import '../config/theme/button_styles.dart';
import '../constant/app_key_contant.dart';
import '../utils/app_utility.dart';
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
                  TitleSubTitleText(
                      head: 'Hospital', title: model.hospitalName),
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

class DoctorRecommendedCard extends StatelessWidget {
  DoctorRecommendedCard(
      {super.key, required this.name, required this.onFindDoctors});

  String name;
  Function(String) onFindDoctors;

  @override
  Widget build(BuildContext context) {
    return appCard(
      child: Row(
        children: [
          Expanded(child: AppText(title: name)),
          IntrinsicWidth(
            child: AppButton(
              title: 'Find Doctors',
              onPressed: () {
                onFindDoctors(name);
              },
              buttonStyleClass: ButtonStyleClass(
                height: 30,
                width: 60,
                textSize: 15,
                horizontalPadding: 0,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SuggestionsCard extends StatelessWidget {
  SuggestionsCard({super.key, required this.name});

  String name;

  @override
  Widget build(BuildContext context) {
    return appCard(
        margin: EdgeInsets.symmetric(
            horizontal: setWidthValue(30), vertical: setHeightValue(3)),
        child: AppText(
          title: name,
          overflow: TextOverflow.clip,
        ));
  }
}

class DataProcessCard extends StatelessWidget {
  DataProcessCard({super.key, required this.model, this.onClick});

  DataProcessModel model;
  Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: appCard(
          child: Column(
        children: [
          Row(
            children: [
              ImageDisplay(image: AssetsConstant.gallery, size: Size(50, 50)),
              Spacer(),
              IntrinsicWidth(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: setWidthValue(20),
                      vertical: setHeightValue(3)),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: TitleSubTitleText(
                    head: 'Token Used',
                    title: model.tokenUsed.toString(),
                    headColor: Theme.of(context).scaffoldBackgroundColor,
                    titleColor: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              )
            ],
          ),
          TitleSubTitleText(
            head: 'Diagnosis',
            title: model.aiGeneratedText.diagnosis,
          ),
          TitleSubTitleText(
            head: 'Treatment',
            title: model.aiGeneratedText.treatment,
          ),
          TitleSubTitleText(
            head: 'Doctors Recommended',
            title: model.aiGeneratedText.doctorsRecommended.toString(),
          ),
          TitleSubTitleText(
            head: 'Suggestions',
            title: model.aiGeneratedText.suggestions.toString(),
          ),
        ],
      )),
    );
  }
}

class LatestNewsCard extends StatelessWidget {
  const LatestNewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: setWidthValue(20)),
      decoration: BoxDecoration(
        color: generateRandomLightColor(),
        borderRadius: BorderRadius.circular(AppSizeConstant.kCardRadius),
        // border: Border.all(color: AppColors.borderColor.withOpacity(0.5))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageDisplay(
            image: AssetsConstant.gallery,
            size: Size(100, 100),
          ),
          20.width,
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title: 'Disease Name',
                textType: TextTypeEnum.Medium,
                fontSize: 16,
              ),
              10.height,
              AppText(title: 'diseases description'),
            ],
          ))
        ],
      ),
    );
  }
}

class PackageCard extends StatelessWidget {
  PackageCard({super.key, required this.model});

  PackageModel model;

  @override
  Widget build(BuildContext context) {
    return appCard(
        padding: EdgeInsets.only(
          left: setWidthValue(20),
          right: setWidthValue(20),
          top: setHeightValue(10),
        ),
        child: Column(children: [
          TitleSubTitleText(
              head: 'package name'.toTitleCase(), title: model.packageName),
          TitleSubTitleText(
              head: 'description'.toTitleCase(), title: model.description),
          TitleSubTitleText(
              head: 'price'.toTitleCase(),
              title: '${dataParser.getFormatPricing(model.price)} PKR'),
          TitleSubTitleText(
              head: 'total tokens'.toTitleCase(),
              title: dataParser.getFormatPricing(model.totalTokens)),
          TitleSubTitleText(
              head: 'For :'.toTitleCase(),
              title: getUserTypeNameFromId(model.userTypeId)),
          AppButton(
            title: 'Buy',
            onPressed: () {},
            buttonStyleClass: ButtonStyleClass(width: 100, height: 34),
          )
        ]));
  }
}

class TokensUsedCard extends StatelessWidget {
  TokensUsedCard({super.key,required this.model});

  TokenUsedModel model;
  @override
  Widget build(BuildContext context) {
    return appCard(child: Column(
      children: [
        TitleSubTitleText(head: 'data process id'.toTitleCase(), title: model.dataProcessId),
        TitleSubTitleText(head: 'tokens used'.toTitleCase(), title: dataParser.getFormatPricing(model.tokenUsed)),
        TitleSubTitleText(head: 'Date'.toTitleCase(), title: dateTimeParserService.dateParser(model.createdAt, format: DateTimeParserService().FORMAT4)),
      ],
    ));
  }
}


Widget appCard(
    {required Widget child, EdgeInsets? margin, EdgeInsets? padding}) {
  return Container(
    width: Get.width,
    padding: padding ??
        EdgeInsets.symmetric(
            horizontal: setWidthValue(30), vertical: setHeightValue(10)),
    margin: margin ??
        EdgeInsets.symmetric(
            horizontal: setWidthValue(30), vertical: setHeightValue(10)),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizeConstant.kCardRadius),
        border: Border.all(color: AppColors.borderColor.withOpacity(0.5))),
    child: child,
  );
}
