import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';

import 'app_print.dart';

class DeviceInformation {
  getInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      appDebugPrint('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      appDebugPrint('Running on ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"
    } else {
      appDebugPrint('no platform found');
    }
    final deviceInfoPlugin = await deviceInfo.deviceInfo;
    final allInfo = deviceInfoPlugin.data;
    appDebugPrint('allInfo ${allInfo.toString()}'); // e.g. "iPod7,1"
    appDebugPrint('deviceInfoPlugin ${deviceInfoPlugin.toString()}'); // e.g. "iPod7,1"
  }
}
