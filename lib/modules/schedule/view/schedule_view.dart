import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/widget/app_scaffold.dart';
import 'package:health_app/widget/app_text.dart';
import '../../../widget/app_appbar.dart';
import '../controller/schedule_controller.dart';
import 'appointment/appointment_schedule_view.dart';
import 'medicine/view/medicine_schedule_view.dart';

class ScheduleView extends StatelessWidget {
  ScheduleView({super.key});

  var controller = Get.put(ScheduleController());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: AppScaffold(
        appBar: AppBar(
          leading: SizedBox(),
          title: AppText(title: 'Schedule View', fontSize: 16, textType: TextTypeEnum.Medium,),
          elevation: 0,
          backgroundColor: Colors.transparent,
          bottom: TabBar(
            indicatorColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1,
            dividerHeight: 0,
            unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w300,
                color: Theme.of(context).textTheme.bodySmall?.color),
            labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
                fontSize: 18
            ),
            tabs: const <Widget>[
              Tab(
                text: 'Appointment',
              ),
              Tab(
                text: 'Medicine',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [ appointment(),medicine(),],
        ),
      ),
    );
  }

  medicine() {
    return MedicineScheduleView(
      controller: controller,
    );
  }

  appointment() {
    return AppointmentScheduleView(
      controller: controller,
    );
  }
}
