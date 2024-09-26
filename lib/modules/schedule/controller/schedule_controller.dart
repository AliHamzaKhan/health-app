import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/utils/app_print.dart';
import '../../../config/db/appointment_schedule_db.dart';
import '../../../config/db/medicine_schedule_db.dart';
import '../../../config/model/appointment_schedule_model.dart';
import '../../../config/model/medicine_schedule_model.dart';

class ScheduleController extends GetxController {
  PageController pageController = PageController();
  RxList<MedicineScheduleModel> medicineSchedulingList = <MedicineScheduleModel>[].obs;
  RxList<AppointmentScheduleModel> appointmentSchedulingList = <AppointmentScheduleModel>[].obs;
  final db1 = MedicineScheduleDB.instance;
  final db2 = AppointmentScheduleDB.instance;



  getMedicines() async {
    appDebugPrint('getMedicines');
    List<MedicineScheduleModel> schedules = await db1.getAllMedicineSchedules();
    medicineSchedulingList.assignAll(schedules);
    update();
  }
  getAppointments() async{
    appDebugPrint('getAppointments');
    List<AppointmentScheduleModel> appointments = await db2.getAllAppointments();
    appointmentSchedulingList.assignAll(appointments);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getAppointments();
    getMedicines();
  }
}
