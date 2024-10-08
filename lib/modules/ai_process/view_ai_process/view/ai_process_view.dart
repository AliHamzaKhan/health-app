import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/config/theme/button_styles.dart';
import 'package:health_app/constant/app_key_contant.dart';
import 'package:health_app/widget/app_button.dart';
import 'package:health_app/widget/app_image.dart';
import 'package:health_app/widget/app_scaffold.dart';
import 'package:health_app/widget/app_text.dart';
import '../controller/ai_process_controller.dart';

class AiProcessView extends StatelessWidget {
  AiProcessView({super.key});

  var controller = Get.put(AiProcessController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        children: [
          ImageDisplay(image: File('filepath'), size: Size(Get.width, 200)),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.height,
              TitleSubTitleText(
                  head: 'Diagnosis',
                  title: controller
                      .dataProcessModel.value.aiGeneratedText.diagnosis),
              20.height,
              TitleSubTitleText(
                  head: 'Treatment',
                  title: controller
                      .dataProcessModel.value.aiGeneratedText.treatment),
              20.height,
              AppText(
                title: 'Doctors Recommended',
                textAlign: TextAlign.left,
                textType: TextTypeEnum.Bold,
              ),
              10.height,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: controller
                    .dataProcessModel.value.aiGeneratedText.doctorsRecommended
                    .map((e) => DoctorRecommendedCard(name: e,))
                    .toList(),
              ),
              20.height,
              AppText(
                title: 'Suggestions',
                textAlign: TextAlign.left,
                textType: TextTypeEnum.Bold,
              ),
              10.height,
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: controller
                    .dataProcessModel.value.aiGeneratedText.suggestions
                    .map((e) => AppText(title: e))
                    .toList(),
              )
            ],
          )
        ],
      ),
    );
  }
}

class DoctorRecommendedCard extends StatelessWidget {
  DoctorRecommendedCard({super.key,required this.name});

  String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: AppText(title: name)),
        AppButton(
            title: 'Find Doctors',
            onPressed: (){},
            buttonStyleClass: ButtonStyleClass(
              height: 30,
              width: 80,
              textSize: 15
            ),
        )
      ],
    );
  }
}

