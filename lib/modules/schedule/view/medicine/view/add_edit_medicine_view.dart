import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/config/theme/button_styles.dart';
import 'package:health_app/utils/app_print.dart';
import 'package:health_app/widget/app_alerts.dart';
import 'package:health_app/widget/app_chips.dart';
import 'package:health_app/widget/app_scaffold.dart';
import 'package:health_app/widget/app_widgets.dart';
import '../../../../../config/size_config.dart';
import '../../../../../constant/app_key_contant.dart';
import '../../../../../utils/date_selection.dart';
import '../../../../../widget/app_appbar.dart';
import '../../../../../widget/app_button.dart';
import '../../../../../widget/app_checkbox.dart';
import '../../../../../widget/app_input_field.dart';

class AddEditMedicineView extends StatelessWidget {
  AddEditMedicineView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: HaAppBar(
        titleText: 'Add Medicine',
      ),

      // appBar(context, titleText: 'Add Medicine'),
      body: Padding(
        padding: const EdgeInsets.all(AppSizeConstant.kPadding),
        child: Column(
          children: [
            AppInputField(
              hintText: 'Medicine Name',
              onChanged: (value) {},
              labelText: 'Medicine Name',
            ),
            10.height,
            AppInputField(
              hintText: 'Description',
              onChanged: (value) {},
              labelText: 'Description',
              maxLines: 3,
            ),
            10.height,
            AppLabeledCheckbox(
              label: 'Notify Me',
              value: true,
              onChanged: (value) {},
              centerPadding: 10,
            ),
            20.height,
            AppButton(
                title: 'Add Time',
                onPressed: () {
                  showAddTimeToMedicine(context, onAddClick: (List<String> times) {
                    appDebugPrint(times);
                  });
                },
                buttonStyleClass: ButtonStyleClass(width: 100, height: 40)),
            const Spacer(),
            AppButton(
                title: 'Save',
                onPressed: () async {
                  DateTime? pickedDateTime = await pickDateTime(context);
                  if (pickedDateTime != null) {
                    // Do something with the selected date and time
                    print('Selected DateTime: $pickedDateTime');
                  }
                }),
            setHeight(20),
          ],
        ),
      ),
    );
  }
}

void showAddTimeToMedicine(BuildContext context, {required Function(List<String>) onAddClick}) {
  List<String> daysOfWeek = [
    'Mon', // Changed to abbreviations
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  Map<String, bool> selectedDays = {};
  bool selectAll = false;
  List<String> timeList = [];
  List<String> selectedTimes = [];

  List<String> generateTimeList() {
    List<String> timeList = [];
    for (int i = 1; i <= 12; i++) {
      String time = i.toString().padLeft(2, '0');
      timeList.add('$time:00 AM');
      timeList.add('$time:00 PM'); // Combine both AM and PM in one loop
    }
    return timeList;
  }

  void addDaysToMap() {
    for (var day in daysOfWeek) {
      selectedDays[day] = false;
    }
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
        timeList = generateTimeList();
        addDaysToMap(); // Initialize days in the map
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
              contentPadding: EdgeInsets.zero,
              insetPadding: EdgeInsets.zero,
              titlePadding: EdgeInsets.zero,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
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
                      const SizedBox(height: 20), // Use SizedBox for spacing
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
                          if (selectedTimes.isEmpty || selectedDays.values.every((isSelected) => !isSelected)) {
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
              ));
        });
      });
}