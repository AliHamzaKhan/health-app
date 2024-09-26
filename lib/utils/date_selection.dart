
import 'package:flutter/material.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../config/enums/date_type_enum.dart';
import '../config/services/date_parser_service.dart';
import '../config/size_config.dart';
import '../config/theme/app_colors.dart';
import '../constant/app_key_contant.dart';
import '../constant/assets_contant.dart';
import '../widget/app_button.dart';
import '../widget/app_text.dart';
import 'app_print.dart';


List<String> daysOfWeek = [
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun',
];
Widget appDateSelectionWidget({
  required context,
  required String label,
  background,
  radius,
  borderColor,
  String? date,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
  required Function(String) onSelectedDate,
  double labelSize = 16,
  String? format,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: setHeightValue(5)),
    child: GestureDetector(
      onTap: () async {
        await appCalendarDialogue(
            context: context,
            selectedDate: onSelectedDate,
            initialDate: initialDate,
            firstDate: firstDate,
            lastDate: lastDate,
            format: format);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            title: label,
            fontSize: labelSize,
            textType: TextTypeEnum.Medium,
          ),
          Stack(
            alignment: Alignment.centerRight,
            children: [
              Container(
                width: Get.width,
                // height: setHeightValue(43),
                padding: const EdgeInsets.only(left: 15,
                top: 11,
                  bottom: 11
                ),
                margin: EdgeInsets.only(right: setWidthValue(30)),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: background ?? AppColors.background,
                    borderRadius: BorderRadius.circular(
                        setHeightValue(radius ?? 5)),
                    border: Border.all(
                        color: borderColor ?? AppColors.accent.withOpacity(0.5),
                        width: setHeightValue(1))),
                child: AppText(
                  title: (date == null || date == '')
                      ? ''
                      : dateTimeParserService.dateParser(date,
                      format: 'EEE MMM dd yyyy'),
                  fontSize: 18,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: AppIconButton(
                  icon: AssetsConstant.time,
                  onTap: null,
                  width: 50,
                  height: 50,
                  iconColor: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

appCalendarDialogue(
    {required context,
      required Function(String) selectedDate,
      DateTime? initialDate,
      DateTime? firstDate,
      DateTime? lastDate,
      String? format}) async {
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
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime.now().subtract(Duration(days: 30)),
      lastDate: lastDate ?? DateTime.now().add(Duration(days: 30)));
  appDebugPrint('picked ${picked.toString()}');
  if (picked != null) {
    selectedDate(dateTimeParserService.dateParser(picked.toString(),
        format: format ?? "EEE MM dd yyyy"));
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
Future<DateTime?> pickDateTime(BuildContext context) async {
  // Show the date picker first
  final DateTime? date = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
  );

  if (date == null) {
    return null;
  }

  final TimeOfDay? time = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.fromDateTime(DateTime.now()),
  );

  if (time == null) {
    return null;
  }

  final DateTime dateTime = DateTime(
    date.year,
    date.month,
    date.day,
    time.hour,
    time.minute,
  );

  return dateTime;
}