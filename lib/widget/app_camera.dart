import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/utils/app_print.dart';
import 'package:health_app/widget/app_scaffold.dart';

class AppCamera extends StatelessWidget {
  // Controller should be initialized once in the constructor or via a method
  final AppCameraController controller = Get.put(AppCameraController());

  AppCamera({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: cameraPreviewWidget(),
    );
  }

  Widget cameraPreviewWidget() {
    final CameraController? cameraController = controller.cameraController;

    if (cameraController == null || !cameraController.value.isInitialized) {
      return const Center(
        child: Text(
          'Tap a camera',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.w900,
          ),
        ),
      );
    } else {
      return Listener(
        onPointerDown: (_) => controller.incrementPointers(),
        onPointerUp: (_) => controller.decrementPointers(),
        child: CameraPreview(
          cameraController,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return GestureDetector(
                behavior: HitTestBehavior.opaque,
                onScaleStart: controller.handleScaleStart,
                onScaleUpdate: (details) =>
                    controller.handleScaleUpdate(details),
                onTapDown: (TapDownDetails details) =>
                    controller.onViewFinderTap(details, constraints),
              );
            },
          ),
        ),
      );
    }
  }
}

class AppCameraController extends GetxController
    with GetTickerProviderStateMixin, WidgetsBindingObserver {
  CameraController? cameraController;
  XFile? imageFile;

  // Variables related to zoom and exposure
  double minAvailableZoom = 1.0;
  double maxAvailableZoom = 1.0;
  double currentScale = 1.0;
  double baseScale = 1.0;
  double minAvailableExposureOffset = 0.0;
  double maxAvailableExposureOffset = 0.0;

  // Animation controller for flash mode UI
  late AnimationController flashModeControlRowAnimationController;
  late Animation<double> flashModeControlRowAnimation;

  int pointers = 0; // Track number of fingers on screen for zooming

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    initializeFlashModeAnimation();
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

  Future<void> initializeCameraController(
      CameraDescription cameraDescription) async {
    final CameraController controller = CameraController(
      cameraDescription,
      kIsWeb ? ResolutionPreset.max : ResolutionPreset.medium,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    cameraController = controller;

    controller.addListener(() {
      if (controller.value.hasError) {
        showInSnackBar('Camera error ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
      await Future.wait(<Future<Object?>>[
        if (!kIsWeb) ...[
          controller.getMinExposureOffset().then(
                  (double value) => minAvailableExposureOffset = value),
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
      initializeCameraController(controller.description);
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

    currentScale = (baseScale * details.scale)
        .clamp(minAvailableZoom, maxAvailableZoom);

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
}

void showInSnackBar(String message) {
  ScaffoldMessenger.of(Get.context!)
      .showSnackBar(SnackBar(content: Text(message)));
}

void _showCameraException(CameraException e) {
  appDebugPrint('${e.code} : ${e.description}');
  showInSnackBar('Error: ${e.code}\n${e.description}');
}