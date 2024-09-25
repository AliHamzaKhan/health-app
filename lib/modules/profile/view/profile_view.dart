


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/config/size_config.dart';
import 'package:health_app/widget/app_appbar.dart';
import 'package:health_app/widget/app_button.dart';
import 'package:health_app/widget/app_scaffold.dart';
import 'package:health_app/widget/app_text.dart';
import '../../../config/routes/app_routes.dart';
import '../controller/profile_controller.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  var controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: HaAppBar(
        actionWidget: setWidth(30),
        titleText: 'Profile',
      ),
      body: Column(
        children: [
          TitleSubTitleText(head: 'First Name', title: 'title'),
          TitleSubTitleText(head: 'First Name', title: 'title'),
          TitleSubTitleText(head: 'Email', title: 'title'),
          TitleSubTitleText(head: 'Date of birth', title: 'title'),
          TitleSubTitleText(head: 'Gender', title: 'title'),
          TitleSubTitleText(head: 'Country', title: 'title'),
          TitleSubTitleText(head: 'Country', title: 'title'),
          AppButton(title: 'Setup Profile', onPressed: (){
            Get.toNamed(AppRoutes.setupProfile);
          })
        ],
      ),
    );
  }
}
