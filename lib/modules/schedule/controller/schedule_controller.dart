


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../config/model/appointment_schedule_model.dart';
import '../../../config/model/medicine_schedule_model.dart';

class ScheduleController extends GetxController{
  PageController pageController = PageController();
  RxList<MedicineScheduleModel> medicineSchedulingList = <MedicineScheduleModel>[].obs;
  RxList<AppointmentScheduleModel> appointmentSchedulingList = <AppointmentScheduleModel>[].obs;

  loadData(){
    for(int i=0; i<10; i++){
      medicineSchedulingList.add(MedicineScheduleModel.fromJson({}));
      appointmentSchedulingList.add(AppointmentScheduleModel.fromJson({}));
    }
  }
  @override
  void onInit() {
    super.onInit();
    loadData();
  }
}