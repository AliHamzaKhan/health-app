
import 'package:flutter/material.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../config/enums/date_type_enum.dart';
import '../config/services/date_parser_service.dart';
import '../config/size_config.dart';
import '../config/theme/app_colors.dart';
import '../widget/app_button.dart';
import '../widget/app_text.dart';

showDateRangePickerDialogue(context,
    {required ValueChanged<DateRange?> onDateRangeChanged}) {
  showDialog(
      context: context,
      // barrierColor: AppColors.borderColor,
      builder: (_) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: Get.width,
            maxHeight: Get.width * 0.9,
          ),
          child: AlertDialog(
            content: DateRangePickerWidget(
              height: Get.width,
              doubleMonth: false,
              maximumDateRangeLength: 10,
              minimumDateRangeLength: 1,
              initialDateRange: DateRange(
                  DateTime.now().subtract(Duration(days: 90)), DateTime.now()),
              // disabledDates: [DateTime(2023, 11, 20)],
              // initialDisplayedDate: selectedDateRange?.start ?? DateTime.now(),
              initialDisplayedDate: DateTime.now(),
              onDateRangeChanged: onDateRangeChanged,
              theme: CalendarTheme(
                selectedColor: Theme.of(context).primaryColor,
                dayNameTextStyle: appTextStyleBold(context, size: 10),
                inRangeColor: Color(0xFFD9EDFA),
                inRangeTextStyle: appTextStyleRegular(context,
                    color: Theme.of(context).primaryColor, size: 13),
                selectedTextStyle:
                    appTextStyleRegular(context, color: Colors.white, size: 13),
                todayTextStyle: TextStyle(fontWeight: FontWeight.bold),
                defaultTextStyle: TextStyle(color: Colors.black, fontSize: 12),
                radius: 10,
                tileSize: setWidthValue(90),
                disabledTextStyle: TextStyle(color: Colors.grey),
              ),
            ),
            actions: [
              AppButton(
                  isOutline: true,
                  title: 'Cancel',
                  btnColor: Colors.transparent,
                  textColor: Theme.of(context).primaryColor,
                  onTap: () {
                    Get.back();
                  }),
              AppButton(
                  title: 'OK',
                  onTap: () {
                    Get.back();
                  })
            ],
          ),
        );
      });
}

appCalendarDialogue(
    {required context,
    selectedDate,
    int? initialDate,
    int? firstDate,
    int? lastDate}) async {
  DateTime? picked = await showDatePicker(
      context: context,
      builder: (context, child) {
        return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: AppColors.primary,
              colorScheme: ColorScheme.light(primary: AppColors.primary),
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor:
                      Colors.teal, // Your desired button text color
                ),
              ),
            ),
            child: child!);
      },
      initialDate: DateTime.now().add(Duration(days: initialDate ?? 0)),
      firstDate: DateTime.now().add(Duration(days: firstDate ?? 0)),
      lastDate: DateTime.now().add(Duration(days: lastDate ?? 365)));
  if (picked != null) {
    selectedDate(dateTimeParserService.dateParser(picked.toString()));
  }
}

(String, String) createDate(DateTypeEnum type) {
  var now = DateTime.now();
  switch (type) {
    case DateTypeEnum.Today:
      String fr = DateFormat(dateTimeParserService.FORMAT2).format(now);
      String to = DateFormat(dateTimeParserService.FORMAT).format(now);
      return (fr, to);
    case DateTypeEnum.Yesterday:
      String fr = DateFormat(dateTimeParserService.FORMAT2)
          .format(now.subtract(Duration(days: 1)));
      String to = DateFormat('yyyy-MM-dd 23:59:50')
          .format(now.subtract(Duration(days: 1)));
      return (fr, to);
    case DateTypeEnum.ThisWeek:
      String fr = DateFormat(dateTimeParserService.FORMAT2)
          .format(now.subtract(Duration(days: 6)));
      String to = DateFormat(dateTimeParserService.FORMAT).format(now);
      return (fr, to);
    case DateTypeEnum.Custom:
      return ('', '');
  }
}

(String, String) getDateTypeEnum(DateTypeEnum type) {
  String date = dateTimeParserService.getFormattedDate(DateTime.now());
  var d = dateTimeParserService.dateParser(date);
  switch (type) {
    case DateTypeEnum.Today:
      return (date, date);
    case DateTypeEnum.Yesterday:
      String d = dateTimeParserService
          .getFormattedDate(DateTime.now().subtract(const Duration(days: 1)));
      return (d, date);
    case DateTypeEnum.ThisWeek:
      String d = dateTimeParserService
          .getFormattedDate(DateTime.now().add(const Duration(days: 7)));
      return (date, d);
    case DateTypeEnum.Custom:
      return ('', '');
    default:
      return ('', '');
  }
}
