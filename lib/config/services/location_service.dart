import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService extends GetxService {
  var isEnable = false.obs;

  grantLocation() async {
    var status = await Permission.location.status;

    await Permission.location
        .onDeniedCallback(() {
          openAppSettings();
          isEnable(false);
        })
        .onGrantedCallback(() {
          isEnable(true);
        })
        .onPermanentlyDeniedCallback(() {
          isEnable(false);
        })
        .onRestrictedCallback(() {
          isEnable(false);
        })
        .onLimitedCallback(() {})
        .onProvisionalCallback(() {})
        .request();

    if (await Permission.location.serviceStatus.isEnabled) {
      isEnable(false);
    }
  }

  Future<Position> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  @override
  void onInit() {
    super.onInit();
    grantLocation();
  }
}
