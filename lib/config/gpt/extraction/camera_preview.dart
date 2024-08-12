


import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:health_app/utils/app_print.dart';
import 'package:path_provider/path_provider.dart';

class AppCameraPreview extends GetxController{
  late List<CameraDescription> cameras;
  late CameraController cameraController;
  late Future<void> initializeControllerFuture;
  var mounted = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeCamera();
  }
  void _initializeCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(cameras[0], ResolutionPreset.high);
    initializeControllerFuture = cameraController.initialize();
    mounted(true);
  }
  Future<XFile?> takePicture() async {
    // final CameraController? cameraController = controller;
    if (!cameraController.value.isInitialized) {
      appDebugPrint('Error: select a camera first.');
      return null;
    }

    if (cameraController.value.isTakingPicture) {
      return null;
    }

    try {
      final XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      appDebugPrint(e);
      return null;
    }
  }
  void onTakePictureButtonPressed() {
    takePicture().then((XFile? file) {
      if (file != null) {
        appDebugPrint('Picture saved to ${file.path}');
      }
    });
  }
  @override
  void onClose() {
    cameraController.dispose();
    super.onClose();
  }
}