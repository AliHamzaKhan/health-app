import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/config/routes/app_routes.dart';
import 'package:health_app/config/size_config.dart';
import 'package:health_app/config/theme/app_colors.dart';
import 'package:health_app/config/theme/button_styles.dart';
import 'package:health_app/constant/assets_contant.dart';
import 'package:health_app/widget/app_button.dart';
import 'package:health_app/widget/app_chips.dart';
import 'package:health_app/widget/app_text.dart';
import 'package:onboarding/onboarding.dart';

import '../../../constant/app_key_contant.dart';
import '../../../widget/app_scaffold.dart';
import '../controller/on_boarding_controller.dart';

class OnBoardingView extends StatefulWidget {
  OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  var controller = Get.put(OnBoardingController());

  List<Widget> onboardingPagesList = [];

  final activePainter = Paint();

  final inactivePainter = Paint();

  @override
  void initState() {
    super.initState();
    activePainter.color = AppColors.background;
    activePainter.strokeWidth = 1;
    activePainter.strokeCap = StrokeCap.round;
    activePainter.style = PaintingStyle.fill;

    inactivePainter.color = AppColors.background;
    inactivePainter.strokeWidth = 1;
    inactivePainter.strokeCap = StrokeCap.round;
    inactivePainter.style = PaintingStyle.stroke;
    onboardingPagesList.add(OnBoardingPage(
      image: AssetsConstant.ob1,
      description: AppStringConstant.obDesc1,
      title: AppStringConstant.obTitle1,
    ));
    onboardingPagesList.add(OnBoardingPage(
      image: AssetsConstant.ob2,
      description: AppStringConstant.obDesc2,
      title: AppStringConstant.obTitle2,
    ));
    onboardingPagesList.add(OnBoardingPage(
      image: AssetsConstant.ob3,
      description: AppStringConstant.obDesc3,
      title: AppStringConstant.obTitle3,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Obx(() => Onboarding(
            swipeableBody: onboardingPagesList,
            startIndex: controller.currentIndex.value,
            onPageChanges: (_, __, currentIndex, sd) {
              controller.currentIndex(currentIndex);
            },
            buildFooter: (context, dragDistance, pagesLength, currentIndex,
                setIndex, sd) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  border: Border.all(
                    width: 0.0,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                child: ColoredBox(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        controller.currentIndex.value != pagesLength - 1
                            ? _skipButton()
                            : _signupButton(),
                        if (controller.currentIndex.value !=
                            pagesLength - 1) ...[
                          Padding(
                            padding: const EdgeInsets.only(right: 45.0),
                            child: Indicator<CirclePainter>(
                              painter: CirclePainter(
                                currentPageIndex: currentIndex,
                                pagesLength: pagesLength,
                                netDragPercent: dragDistance,
                                activePainter: activePainter,
                                inactivePainter: inactivePainter,
                                slideDirection: sd,
                                radius: 5.0,
                                space: 10.0,
                                showAllActiveIndicators: false,
                              ),
                            ),
                          ),
                        ]
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }

  Widget _skipButton() {
    return AppChips(
        label: 'Skip',
        padding: EdgeInsets.symmetric(horizontal: setWidthValue(50)),
        borderRadius: 10,
        value: false,
        onTap: (value) {
          controller.currentIndex.value = 2;
        });
  }

  Widget _signupButton() {
    return Expanded(
      child: AppButton(
        title: 'Get Started',
        // buttonStyleClass: ButtonStyleClass(
        //   backgroundColor: AppColors.background
        // ),
        // buttonType: ButtonType.Outline,
        buttonStyleClass: ButtonStyleClass(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          textColor: Theme.of(context).primaryColor,
          radius: 10
        ),
        onPressed: () {
          Get.toNamed(AppRoutes.login);
        },
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage(
      {required this.image, required this.title, required this.description});

  String image;
  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      padding: EdgeInsets.symmetric(horizontal: setWidthValue(30)),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          Image.asset(
            image,
            width: Get.width,
            height: Get.width,
            fit: BoxFit.contain,
          ),
          // setHeight(5),
          AppText(
            title: title,
            textType: TextTypeEnum.Bold,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
            fontSize: 22,
            color: Theme.of(context).primaryColor,
          ),
          setHeight(20),
          AppText(
            title: description,
            textType: TextTypeEnum.Regular,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
            color: Theme.of(context).textTheme.bodyLarge?.color,
            fontSize: 16,
          )
        ],
      ),
    );
  }
}
