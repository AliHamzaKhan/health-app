


import 'dart:io';
import 'package:alarm/alarm.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class AlarmManager extends GetxController implements GetxService{

  // final AlarmSettings? alarmSettings;
  AlarmSettings buildAlarmSettings() {
    final id = DateTime.now().millisecondsSinceEpoch % 10000 + 1;

    final alarmSettings = AlarmSettings(
      id: id,
      dateTime: DateTime.now(),
      loopAudio: true,
      vibrate: true,
      volume: 60,
      assetAudioPath: 'assetAudio',
      notificationTitle: 'Alarm example',
      notificationBody: 'Your alarm ($id) is ringing',
      enableNotificationOnKill: Platform.isIOS,
    );
    return alarmSettings;
  }

  bool saveAlarm() {
    bool isDone = false;
    Alarm.set(alarmSettings: buildAlarmSettings()).then((res) {
      isDone = true;
      return isDone;
    });
    return isDone;
  }

  bool deleteAlarm(alarmId) {
    bool isDone = false;
    Alarm.stop(alarmId).then((res) {
      isDone = true;
      return isDone;
    });
    return isDone;
  }
  List<AlarmSettings> loadAlarms() {
    List<AlarmSettings> alarms = [];
    alarms = Alarm.getAlarms();
    alarms.sort((a, b) => a.dateTime.isBefore(b.dateTime) ? 0 : 1);
    return alarms;
  }
  Future<void> checkAndroidNotificationPermission() async {
    final status = await Permission.notification.status;
    if (status.isDenied) {
      alarmPrint('Requesting notification permission...');
      final res = await Permission.notification.request();
      alarmPrint(
        'Notification permission ${res.isGranted ? '' : 'not '}granted',
      );
    }
  }
  Future<void> checkAndroidExternalStoragePermission() async {
    final status = await Permission.storage.status;
    if (status.isDenied) {
      alarmPrint('Requesting external storage permission...');
      final res = await Permission.storage.request();
      alarmPrint(
        'External storage permission ${res.isGranted ? '' : 'not'} granted',
      );
    }
  }
  Future<void> checkAndroidScheduleExactAlarmPermission() async {
    final status = await Permission.scheduleExactAlarm.status;
    alarmPrint('Schedule exact alarm permission: $status.');
    if (status.isDenied) {
      alarmPrint('Requesting schedule exact alarm permission...');
      final res = await Permission.scheduleExactAlarm.request();
      alarmPrint(
        'Schedule exact alarm permission ${res.isGranted ? '' : 'not'} granted',
      );
    }
  }

  @override
  void onInit() {
    if (Alarm.android) {
      checkAndroidNotificationPermission();
      checkAndroidScheduleExactAlarmPermission();
      checkAndroidExternalStoragePermission();
    }
    super.onInit();
  }
}