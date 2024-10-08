import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/config/services/data_parser_service.dart';
import 'package:health_app/config/theme/app_colors.dart';
import 'package:health_app/config/theme/button_styles.dart';
import 'package:health_app/constant/app_key_contant.dart';
import 'package:health_app/widget/app_button.dart';
import 'package:health_app/widget/app_image.dart';
import 'package:health_app/widget/app_scaffold.dart';
import 'package:health_app/widget/app_text.dart';
import '../../../../constant/assets_contant.dart';
import '../../../../widget/app_appbar.dart';
import '../../../../widget/app_card.dart';
import '../../ai_image_view.dart';
import '../controller/ai_process_controller.dart';

class AiProcessView extends StatelessWidget {
  AiProcessView({super.key});

  var controller = Get.put(AiProcessController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: HaAppBar(
        titleText: 'Data Processed Result',
        actionType: AppBarActionType.Custom,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  Get.to(() => AiImageView());
                },
                child: ImageDisplay(
                    image: AssetsConstant.gallery, size: Size(Get.width, 200))),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.height,
                appCard(
                  child: TitleSubTitleText(
                      head: 'Diagnosis',
                      title: controller
                          .dataProcessModel.value.aiGeneratedText.diagnosis
                          .toTitleCase(),
                      titleMaxLines: 10),
                ),
                // 20.height,

                appCard(
                    child: TitleSubTitleText(
                        head: 'Treatment',
                        title: controller
                            .dataProcessModel.value.aiGeneratedText.treatment
                            .toTitleCase(),
                        titleMaxLines: 10)),
                20.height,
                Center(
                  child: AppText(
                    title: 'Doctors Recommended',
                    textAlign: TextAlign.left,
                    textType: TextTypeEnum.Bold,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: controller
                      .dataProcessModel.value.aiGeneratedText.doctorsRecommended
                      .map((e) => DoctorRecommendedCard(
                            name: e,
                            onFindDoctors: (doctor) {},
                          ))
                      .toList(),
                ),
                20.height,
                Center(
                  child: AppText(
                    title: 'Suggestions',
                    textAlign: TextAlign.left,
                    textType: TextTypeEnum.Bold,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: controller
                      .dataProcessModel.value.aiGeneratedText.suggestions
                      .map((e) => SuggestionsCard(name: e))
                      .toList(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
