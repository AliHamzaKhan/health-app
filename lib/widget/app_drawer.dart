import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/config/routes/app_routes.dart';
import 'package:health_app/config/size_config.dart';
import 'package:health_app/constant/assets_contant.dart';
import 'package:health_app/widget/app_button.dart';
import 'package:health_app/widget/app_text.dart';
import 'package:health_app/widget/app_widgets.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({super.key});

  bool isAnimated = false;

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer>
    with SingleTickerProviderStateMixin {
  Duration duration = const Duration(milliseconds: 100);
  double width = setWidthValue(150);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: duration,
      height: Get.height,
      width: widget.isAnimated ? (Get.width * 0.6) : width,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          setHeight(20),
          AppIconButton(
              icon: !widget.isAnimated
                  ? Icons.arrow_forward_ios
                  : Icons.arrow_back_ios,
              onTap: () {
                setState(() {
                  widget.isAnimated = !widget.isAnimated;
                });
              }),
          setHeight(30),
          Expanded(
              child: ListView.builder(
                  itemCount: appDrawersList.length,
                  itemBuilder: (context, index) {
                    return DrawerItem(
                      item: appDrawersList[index],
                      width: width,
                      isAnimated: widget.isAnimated,
                    );
                  })),
          setHeight(20),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  DrawerItem(
      {super.key,
      required this.item,
      required this.width,
      this.isAnimated = false});

  AppDrawerClass item;
  double width;
  bool isAnimated;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.onClick,
      child: Padding(
        padding: EdgeInsets.all(setWidthValue(30)),
        child: Row(
          children: [
            setImage(image: item.image, width: width - 30, height: width - 30),
            if (isAnimated) ...[
              Flexible(
                flex: 1,
                child: AnimatedOpacity(
                  opacity: isAnimated ? 1 : 0,
                  duration: Duration(seconds: 1),
                  child: setWidth(20),
                ),
              ),
              Flexible(
                flex: 4,
                child: AnimatedOpacity(
                  opacity: isAnimated ? 1 : 0,
                  duration: Duration(seconds: 1),
                  child: getText(),
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }

  Widget getText() {
    return AppText(
      title: item.title,
      fontSize: 14,
    );
  }
}

List<AppDrawerClass> appDrawersList = [
  AppDrawerClass(
      title: 'Ecg Reader',
      image: AssetsConstant.ecg,
      onClick: () {
        Get.toNamed(AppRoutes.ecg);
      }),
  AppDrawerClass(
      title: 'EEG Reader',
      image: AssetsConstant.eeg,
      onClick: () {
        Get.toNamed(AppRoutes.eeg);
      }),
  AppDrawerClass(
      title: 'BMI Calculator',
      image: AssetsConstant.bmi,
      onClick: () {
        Get.toNamed(AppRoutes.bmi);
      }),
  AppDrawerClass(
      title: 'Blood Test',
      image: AssetsConstant.bloodTest,
      onClick: () {
        Get.toNamed(AppRoutes.bloodTest);
      }),
  AppDrawerClass(
      title: 'Allergy Detection',
      image: AssetsConstant.allergy,
      onClick: () {
        Get.toNamed(AppRoutes.allergyDetection);
      }),
  AppDrawerClass(
      title: 'Radiology Report',
      image: AssetsConstant.radiology,
      onClick: () {
        Get.toNamed(AppRoutes.radiology);
      }),
  AppDrawerClass(
      title: 'Medicine Searching',
      image: AssetsConstant.medicine,
      onClick: () {
        Get.toNamed(AppRoutes.medicine);
      }),
  AppDrawerClass(
      title: 'Find Calories',
      image: AssetsConstant.calories,
      onClick: () {
        Get.toNamed(AppRoutes.calories);
      }),
  AppDrawerClass(
      title: 'Find Doctor',
      image: AssetsConstant.doctor,
      onClick: () {
        Get.toNamed(AppRoutes.findDoctor);
      }),
  AppDrawerClass(
      title: 'Monitor Sugar',
      image: AssetsConstant.bloodSugar,
      onClick: () {
        Get.toNamed(AppRoutes.monitorSugar);
      }),
  AppDrawerClass(
      title: 'Find Hospitals',
      image: AssetsConstant.hospital,
      onClick: () {
        Get.toNamed(AppRoutes.findHospital);
      }),
];

class AppDrawerClass {
  String title;
  String image;
  var onClick;

  AppDrawerClass({required this.title, required this.image, required this.onClick});
}
