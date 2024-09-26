import 'package:get/get.dart';
import 'package:health_app/utils/app_print.dart';
import '../../../../../config/db/medicine_schedule_db.dart';
import '../../../../../config/model/medicine_schedule_model.dart';
import '../../../../../utils/date_selection.dart';

class AddEditMedicineController extends GetxController {
  Rx<MedicineScheduleModel> model = MedicineScheduleModel.fromJson({}).obs;

  Map<String, List<String>> groupTimesByDay(List<String> selectedTimeDates) {
    Map<String, List<String>> groupedTimes = {};
    for (String day in daysOfWeek) {
      groupedTimes[day] = [];
    }
    for (var date in selectedTimeDates) {
      var parts = date.split(RegExp(r'\s+'));
      if (parts.length == 3) {
        String day = parts[0];
        String time = '${parts[1]} ${parts[2]}';

        if (groupedTimes.containsKey(day)) {
          groupedTimes[day]!.add(time);
        }
      }
    }
    return groupedTimes;
  }

  Future addMedicine() async {
    appDebugPrint('addMedicine');
    appDebugPrint(model.value.timing);
    appDebugPrint(model.value.timing.toString());
    // return;
    final db = MedicineScheduleDB.instance;
    if (model.value.id.trim().isEmpty) {
      await db.insertMedicineSchedule(model.value);
    } else {
      await db.updateMedicineSchedule(model.value);
    }

    List<MedicineScheduleModel> schedules = await db.getAllMedicineSchedules();
    appDebugPrint('schedules $schedules');
    Get.back();
  }
  getArgs(){
    model.value = Get.arguments['args'] ?? MedicineScheduleModel.fromJson({});
  }
  @override
  void onInit() {
    super.onInit();
    getArgs();
  }
}
