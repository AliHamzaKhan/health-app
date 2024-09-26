import 'package:get/get.dart';
import 'package:health_app/utils/app_print.dart';
import '../../../../../config/db/appointment_schedule_db.dart';
import '../../../../../config/model/appointment_schedule_model.dart';

class AddEditAppointmentController extends GetxController {
  Rx<AppointmentScheduleModel> model =
      AppointmentScheduleModel.fromJson({}).obs;

  final db = AppointmentScheduleDB.instance;

  addAppointment() {
    if (model.value.id.trim().isEmpty) {
      appDebugPrint('insertAppointment');
      db.insertAppointment(model.value);
    } else {
      appDebugPrint('updateAppointment');
      db.updateAppointment(model.value);
    }
    Get.back();
  }

  getArgs() {
    model.value =
        Get.arguments['args'] ?? AppointmentScheduleModel.fromJson({});
  }

  @override
  void onInit() {
    super.onInit();
    getArgs();
  }
}
