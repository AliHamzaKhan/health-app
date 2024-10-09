import 'package:flutter/material.dart';
import 'package:health_app/constant/assets_contant.dart';
import 'package:health_app/widget/app_image.dart';
import 'package:health_app/widget/app_scaffold.dart';
import '../../widget/app_appbar.dart';

class AiImageView extends StatelessWidget {
  AiImageView({super.key, this.image});
  var image;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: Colors.black,
      appBar: HaAppBar(
        titleText: '',
        actionType: AppBarActionType.Custom,
      ),
      body: ImageDisplay(
        image: image,
        size: Size(double.infinity, double.infinity),
      ),
    );
  }
}
