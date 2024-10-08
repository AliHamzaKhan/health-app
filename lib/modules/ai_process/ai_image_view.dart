import 'package:flutter/material.dart';
import 'package:health_app/constant/assets_contant.dart';
import 'package:health_app/widget/app_image.dart';
import 'package:health_app/widget/app_scaffold.dart';
import '../../widget/app_appbar.dart';

class AiImageView extends StatelessWidget {
  AiImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: HaAppBar(
        titleText: '',
        actionType: AppBarActionType.Custom,
      ),
      body: ImageDisplay(
        image: AssetsConstant.gallery,
        size: Size(double.infinity, double.infinity),
      ),
    );
  }
}
