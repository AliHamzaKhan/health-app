import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/config/size_config.dart';
import 'package:health_app/constant/assets_contant.dart';
import 'package:health_app/utils/app_print.dart';
import 'package:health_app/widget/app_button.dart';
import 'package:health_app/widget/app_scaffold.dart';
import 'package:image_picker/image_picker.dart';

class AppCamera extends StatelessWidget {
  // Controller should be initialized once in the constructor or via a method
  final AppCameraController controller = Get.put(AppCameraController());

  AppCamera({super.key, required this.onImageClick});

  Function(File) onImageClick;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: cameraPreviewWidget(context, onImageClick: onImageClick),
    );
  }

  Widget cameraPreviewWidget(context, {required Function(File) onImageClick}) {
    return Obx(() {
      final CameraController? cameraController = controller.cameraController;

      if (!controller.isCameraInitialized.value ||
          cameraController == null ||
          !cameraController.value.isInitialized) {
        return const Center(
          child: Text(
            'Initializing camera...',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.w900,
            ),
          ),
        );
      } else {
        return controller.imageFile?.value.path != ''
            ? Stack(
                children: [
                  Image.file(
                    File(controller.imageFile!.value.path),
                    width: Get.width,
                    height: Get.height,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: AppButton(
                                  title: 'Retake',
                                  onPressed: () {
                                    controller.imageFile.value = XFile('');
                                  })),
                          setWidth(10),
                          Expanded(
                              child: AppButton(
                                  title: 'Check',
                                  onPressed: () {
                                    onImageClick(File(controller.imageFile!.value.path));
                                  })),
                        ],
                      ),
                    ),
                  )
                ],
              )
            : Stack(
                children: [
                  Container(
                    width: Get.width,
                    height: Get.height,
                    child: Listener(
                      onPointerDown: (_) => controller.incrementPointers(),
                      onPointerUp: (_) => controller.decrementPointers(),
                      child: CameraPreview(
                        cameraController,
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onScaleStart: controller.handleScaleStart,
                              onScaleUpdate: (details) =>
                                  controller.handleScaleUpdate(details),
                              onTapDown: (TapDownDetails details) => controller
                                  .onViewFinderTap(details, constraints),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.all(setWidthValue(50)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppIconButton(
                            icon: AssetsConstant.reload,
                            onTap: () {
                              controller.onCameraChange();
                            },
                            btnColor: Theme.of(context).scaffoldBackgroundColor,
                            iconColor: Theme.of(context).primaryColor,
                          ),
                          AppIconButton(
                            icon: AssetsConstant.add,
                            onTap: () {
                              controller.onPictureClick();
                            },
                            width: 70,
                            height: 70,
                            iconSize: 45,
                            btnColor: Theme.of(context).primaryColor,
                            iconColor:
                                Theme.of(context).scaffoldBackgroundColor,
                          ),
                          AppIconButton(
                            icon: AssetsConstant.gallery,
                            onTap: () {
                              controller.onOpenGallery();
                            },
                            btnColor: Theme.of(context).scaffoldBackgroundColor,
                            iconColor: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
      }
    });
  }
}

class AppCameraController extends GetxController
    with GetTickerProviderStateMixin, WidgetsBindingObserver {
  CameraController? cameraController;
  Rx<XFile> imageFile = XFile('').obs;
  double minAvailableZoom = 1.0;
  double maxAvailableZoom = 1.0;
  double currentScale = 1.0;
  double baseScale = 1.0;
  double minAvailableExposureOffset = 0.0;
  double maxAvailableExposureOffset = 0.0;

  late AnimationController flashModeControlRowAnimationController;
  late Animation<double> flashModeControlRowAnimation;

  int pointers = 0; // Track number of fingers on screen for zooming
  var isCameraInitialized = false.obs;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    initializeFlashModeAnimation();
    _initializeCamera(); // Call the camera initialization
  }

  @override
  void onClose() {
    cameraController?.dispose();
    WidgetsBinding.instance.removeObserver(this);
    flashModeControlRowAnimationController.dispose();
    super.onClose();
  }

  void initializeFlashModeAnimation() {
    flashModeControlRowAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    flashModeControlRowAnimation = CurvedAnimation(
      parent: flashModeControlRowAnimationController,
      curve: Curves.easeInCubic,
    );
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        await initializeCameraController(cameras.first);
        isCameraInitialized.value = true;
      } else {
        handleCameraException(CameraException(
            'NoCameraAvailable', 'No cameras are available on this device.'));
      }
    } catch (e) {
      handleCameraException(
          CameraException('CameraInitializationError', e.toString()));
    }
  }

  Future<void> initializeCameraController(CameraDescription cameraDescription) async {
    final CameraController controller = CameraController(
      cameraDescription,
      kIsWeb ? ResolutionPreset.max : ResolutionPreset.medium,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    cameraController = controller;

    controller.addListener(() {
      if (controller.value.hasError) {
        showInSnackBar('Camera error: ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
      await Future.wait(<Future<Object?>>[
        if (!kIsWeb) ...[
          controller
              .getMinExposureOffset()
              .then((double value) => minAvailableExposureOffset = value),
          controller
              .getMaxExposureOffset()
              .then((double value) => maxAvailableExposureOffset = value),
        ],
        controller
            .getMaxZoomLevel()
            .then((double value) => maxAvailableZoom = value),
        controller
            .getMinZoomLevel()
            .then((double value) => minAvailableZoom = value),
      ]);
      cameraController = controller;
    } on CameraException catch (e) {
      handleCameraException(e);
    }
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? controller = cameraController;

    if (controller == null || !controller.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      controller.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initializeCamera(); // Reinitialize the camera when app is resumed
    }
  }

  // Methods for handling scale gestures (zoom)
  void handleScaleStart(ScaleStartDetails details) {
    baseScale = currentScale;
  }

  Future<void> handleScaleUpdate(ScaleUpdateDetails details) async {
    if (cameraController == null || pointers != 2) {
      return;
    }

    currentScale =
        (baseScale * details.scale).clamp(minAvailableZoom, maxAvailableZoom);

    await cameraController?.setZoomLevel(currentScale);
  }

  // Method for handling tap to focus and set exposure
  void onViewFinderTap(TapDownDetails details, BoxConstraints constraints) {
    if (cameraController == null) {
      return;
    }

    final CameraController controller = this.cameraController!;

    final Offset offset = Offset(
      details.localPosition.dx / constraints.maxWidth,
      details.localPosition.dy / constraints.maxHeight,
    );

    controller.setExposurePoint(offset);
    controller.setFocusPoint(offset);
  }

  // Methods for managing the number of pointers (fingers) on screen
  void incrementPointers() => pointers++;

  void decrementPointers() => pointers--;

  // Error handling
  void handleCameraException(CameraException e) {
    switch (e.code) {
      case 'CameraAccessDenied':
        showInSnackBar('You have denied camera access.');
        break;
      case 'CameraAccessDeniedWithoutPrompt':
        showInSnackBar('Please go to Settings app to enable camera access.');
        break;
      case 'CameraAccessRestricted':
        showInSnackBar('Camera access is restricted.');
        break;
      case 'AudioAccessDenied':
        showInSnackBar('You have denied audio access.');
        break;
      case 'AudioAccessDeniedWithoutPrompt':
        showInSnackBar('Please go to Settings app to enable audio access.');
        break;
      case 'AudioAccessRestricted':
        showInSnackBar('Audio access is restricted.');
        break;
      default:
        _showCameraException(e);
        break;
    }
  }

  Future<void> onCameraChange() async {
    if (cameraController == null) return;

    try {

      final cameras = await availableCameras();

      appDebugPrint('cameras_length ${cameras.length}');
      final currentIndex = cameras.indexOf(cameraController!.description);

      // Determine the next camera index
      final nextIndex = (currentIndex + 1) % cameras.length;
      final newCameraDescription = cameras[nextIndex];
      await initializeCameraController(newCameraDescription);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> onPictureClick() async {
    appDebugPrint('onPictureClick');
    appDebugPrint('${cameraController == null} || ${!cameraController!.value.isInitialized}');


    if (cameraController == null || !cameraController!.value.isInitialized)
      return;

    try {
      final XFile picture = await cameraController!.takePicture();
      appDebugPrint('imageFile1 ${picture}');
      imageFile!(picture);

      appDebugPrint('imageFile2 ${imageFile!.value.path}');


      // You can also add code here to display the picture or navigate to a different screen.
      showInSnackBar('Picture captured successfully!');
    } catch (e) {
      handleCameraException(
          CameraException('PictureCaptureError', e.toString()));
    }
  }

  Future<void> onOpenGallery() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile =
          await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        imageFile?.value = pickedFile;
        // Add code to display the selected image or perform other actions.
        showInSnackBar('Image selected from gallery!');
      } else {
        showInSnackBar('No image selected.');
      }
    } catch (e) {
      handleCameraException(
          CameraException('GalleryAccessError', e.toString()));
    }
  }
}

void showInSnackBar(String message) {
  ScaffoldMessenger.of(Get.context!)
      .showSnackBar(SnackBar(content: Text(message)));
}

void _showCameraException(CameraException e) {
  appDebugPrint('${e.code} : ${e.description}');
  showInSnackBar('Error: ${e.code}\n${e.description}');
}
