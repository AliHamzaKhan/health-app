import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../config/services/date_parser_service.dart';
import '../config/theme/app_colors.dart';
import 'app_print.dart';

Future<String> selectDate(BuildContext context) async {
  String date = '';

  DateTime currentDate = DateTime.now();
  DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: currentDate,
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          primaryColor: AppColors.primary,
          colorScheme: ColorScheme.light(primary: AppColors.primary),
          buttonTheme:
              const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.teal, // Your desired button text color
            ),
          ),
        ),
        child: child!,
      );
    },
  );
  if (selectedDate != null && selectedDate != currentDate) {
    date = dateTimeParserService.getFormattedDate(selectedDate);
    appDebugPrint('Selected date: $selectedDate');
  }
  return date;
}

Future<DateTimeRange?> showCustomDateRangePicker({
  required BuildContext context,
  DateTimeRange? initialDateRange,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  return showDateRangePicker(
    context: context,
    firstDate: firstDate ?? DateTime(DateTime.now().year - 5),
    lastDate: lastDate ?? DateTime(DateTime.now().year + 5),
    initialDateRange: initialDateRange ??
        DateTimeRange(
          end: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day + 13),
          start: DateTime.now(),
        ),
    initialEntryMode: DatePickerEntryMode.inputOnly,
    builder: (BuildContext context, Widget? child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400, maxHeight: 600),
            child: Theme(
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
              child: child!,
            ),
          ),
        ],
      );
    },
  );
}

String splitString(String input, {int maxWordsPerLine = 20, int maxLines = 1}) {
  List<String> words = input.split(' ');

  String result = '';
  String currentLine = '';

  for (int i = 0; i < words.length; i++) {
    if (currentLine.isEmpty) {
      currentLine = words[i];
    } else {
      currentLine += ' ${words[i]}';
    }

    if (currentLine.split(' ').length > maxWordsPerLine) {
      result += '$currentLine\n';
      currentLine = '';
    }

    if (result.split('\n').length >= maxLines) {
      break;
    }
  }

  // Add any remaining words
  if (currentLine.isNotEmpty) {
    result += currentLine;
  }

  return result;
}

List<int> generatePaginationNumbers(
    int totalItems, int currentPage, int itemsPerPage) {
  const maxVisiblePages = 7;

  int totalPages = (totalItems / itemsPerPage).ceil();

  if (totalPages <= maxVisiblePages) {
    return List<int>.generate(totalPages, (index) => index + 1);
  } else {
    List<int> result = [];

    if (currentPage <= maxVisiblePages - 2) {
      result.addAll(
          List<int>.generate(maxVisiblePages - 1, (index) => index + 1));
      result.add(-1); // Use -1 or any other value to indicate a gap
      result.add(totalPages);
    } else if (currentPage >= totalPages - maxVisiblePages + 3) {
      result.add(1);
      result.add(-1); // Use -1 or any other value to indicate a gap
      result.addAll(List<int>.generate(maxVisiblePages - 1,
          (index) => totalPages - maxVisiblePages + 2 + index));
    } else {
      result.add(1);
      result.add(-1); // Use -1 or any other value to indicate a gap
      int start = currentPage - (maxVisiblePages ~/ 2);
      int end = currentPage + (maxVisiblePages ~/ 2) - 2;
      result.addAll(
          List<int>.generate(end - start + 1, (index) => start + index));
      result.add(-1); // Use -1 or any other value to indicate a gap
      result.add(totalPages);
    }

    return result;
  }
}

String formatValue(int value) {
  if (value % 1000 == 0) {
    return '${value ~/ 1000}k';
  } else {
    return NumberFormat.decimalPattern().format(value);
  }
}
Color generateRandomColor() {
  final Random random = Random();
  return Color.fromARGB(
    255, // Alpha channel (fully opaque)
    random.nextInt(256), // Red value (0 to 255)
    random.nextInt(256), // Green value (0 to 255)
    random.nextInt(256), // Blue value (0 to 255)
  );
}
Color generateRandomLightColor() {
  final Random random = Random();
  // Generate random values between 180 and 255 to ensure light colors
  return Color.fromARGB(
    255, // Alpha channel (fully opaque)
    180 + random.nextInt(76), // Red value (180 to 255)
    180 + random.nextInt(76), // Green value (180 to 255)
    180 + random.nextInt(76), // Blue value (180 to 255)
  );
}