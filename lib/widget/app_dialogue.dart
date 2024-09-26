import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/theme/button_styles.dart';
import '../utils/app_print.dart';
import '../utils/date_selection.dart';
import 'app_alerts.dart';
import 'app_button.dart';
import 'app_checkbox.dart';
import 'app_chips.dart';
import 'app_widgets.dart';

void showAddTimeToMedicine(
  BuildContext context, {
  required Function(List<String>) onAddClick,
  required List<String> selectedTimeDates,
}) {
  Map<String, bool> selectedDays = {};
  bool selectAll = false;
  List<String> timeList = [];
  List<String> selectedTimes = [];

  List<String> generateTimeList() {
    List<String> timeList = [];
    for (int i = 1; i <= 12; i++) {
      String time = i.toString().padLeft(2, '0');
      timeList.add('$time:00 AM');
      timeList.add('$time:00 PM');
    }
    return timeList;
  }

  void addDaysToMap() {
    for (var day in daysOfWeek) {
      selectedDays[day] = false;
    }
  }

  void prepopulateSelectedDates() {
    appDebugPrint('prepopulateSelectedDates ${selectedTimeDates}');
    for (var date in selectedTimeDates) {
      var parts = date.split(RegExp(r'\s+'));
      if (parts.length == 3) {
        String day = parts[0];
        String time = '${parts[1]} ${parts[2]}';

        appDebugPrint('day $day');
        if (daysOfWeek.contains(day)) {
          selectedDays[day] = true;
        }

        if (!selectedTimes.contains(time)) {
          selectedTimes.add(time);
        }
      }
    }

    appDebugPrint('selectedTimes $selectedTimes');
  }

  void toggleSelectAll(setState) {
    setState(() {
      selectAll = !selectAll;
      selectedDays.forEach((key, _) {
        selectedDays[key] = selectAll;
      });
    });
  }

  List<String> getSelectedDateAndTime() {
    List<String> selectedDateAndTime = [];
    selectedDays.forEach((day, isSelected) {
      if (isSelected) {
        for (var time in selectedTimes) {
          selectedDateAndTime.add('$day $time');
        }
      }
    });
    return selectedDateAndTime;
  }

  showDialog(
    context: context,
    builder: (context) {
      addDaysToMap();
      prepopulateSelectedDates();
      timeList = generateTimeList();

      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: IntrinsicHeight(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.98,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Column(
                children: [
                  appHeaderText('Add Time'),
                  const SizedBox(height: 20),
                  AppLabeledCheckbox(
                    label: 'Select All',
                    value: selectAll,
                    onChanged: (value) {
                      toggleSelectAll(setState);
                    },
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: daysOfWeek.map((day) {
                        return Padding(
                          padding: const EdgeInsets.all(3),
                          child: FilterChip(
                            selectedColor: Colors.green.shade300,
                            disabledColor: Colors.green.shade100,
                            label: Text(day),
                            selected: selectedDays[day] ?? false,
                            onSelected: (value) {
                              setState(() {
                                selectedDays[day] = value;
                              });
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    children: timeList.map((time) {
                      bool isSelected = selectedTimes.contains(time);
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: AppChips(
                          label: time,
                          value: isSelected,
                          onTap: (value) {
                            setState(() {
                              if (value) {
                                selectedTimes.add(time);
                              } else {
                                selectedTimes.remove(time);
                              }
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                  AppButton(
                    title: 'Add',
                    onPressed: () {
                      if (selectedTimes.isEmpty ||
                          selectedDays.values
                              .every((isSelected) => !isSelected)) {
                        appAlerts.customAlert(
                          title: 'Error',
                          subTitle: 'Please select at least one time and day',
                        );
                      } else {
                        onAddClick(getSelectedDateAndTime());
                        Get.back();
                      }
                    },
                    buttonStyleClass: ButtonStyleClass(
                      width: 100,
                      height: 35,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
    },
  );
}
