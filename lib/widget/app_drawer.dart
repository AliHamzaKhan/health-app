import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                  itemBuilder: (context, index){
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
    return Container(
      // margin: EdgeInsets.all(setWidthValue(30)),
      // width: isAnimated ? (Get.width * 0.6) : width,
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
      title: 'Ecg Reader', image: AssetsConstant.ecg, onClick: () {}),
  AppDrawerClass(
      title: 'BMI Calculator', image: AssetsConstant.bmi, onClick: () {}),
  AppDrawerClass(
      title: 'Blood Test', image: AssetsConstant.bloodTest, onClick: () {}),
  AppDrawerClass(
      title: 'Allergy Detection',
      image: AssetsConstant.allergy,
      onClick: () {}),
  AppDrawerClass(
      title: 'Radiology Report',
      image: AssetsConstant.radiology,
      onClick: () {}),
  AppDrawerClass(
      title: 'Medicine Searching',
      image: AssetsConstant.medicine,
      onClick: () {}),
  AppDrawerClass(
      title: 'Find Doctor', image: AssetsConstant.doctor, onClick: () {}),
  AppDrawerClass(
      title: 'Monitor Sugar', image: AssetsConstant.bloodSugar, onClick: () {}),
  AppDrawerClass(
      title: 'Find Hospitals', image: AssetsConstant.hospital, onClick: () {}),
];

class AppDrawerClass {
  String title;
  String image;
  var onClick;

  AppDrawerClass(
      {required this.title, required this.image, required this.onClick});
}
