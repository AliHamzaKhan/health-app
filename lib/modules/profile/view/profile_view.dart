import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/config/size_config.dart';
import 'package:health_app/constant/app_key_contant.dart';
import 'package:health_app/widget/app_appbar.dart';
import 'package:health_app/widget/app_button.dart';
import 'package:health_app/widget/app_card.dart';
import 'package:health_app/widget/app_scaffold.dart';
import 'package:health_app/widget/app_text.dart';
import '../../../config/routes/app_routes.dart';
import '../../../constant/assets_contant.dart';
import '../../../widget/app_image.dart';
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
      body: SingleChildScrollView(
        padding: appPadding,
        child: Column(
          children: [
            appCard(
                margin: EdgeInsets.zero,
                child: Column(
                  children: [
                    10.height,
                    ClipRRect(
                      child: ImageDisplay(
                          image: AssetsConstant.userProfileImage,
                          size: Size(100, 100)),
                    ),
                    appCard(child: TitleSubTitleText(head: 'First Name', title: controller.userProfile.value.firstName)),
                    10.height,
                    appCard(child: TitleSubTitleText(head: 'Last Name', title: controller.userProfile.value.lastName)),
                    10.height,
                    appCard(child: TitleSubTitleText(head: 'Email', title: controller.userProfile.value.email)),
                    10.height,
                    appCard(child: TitleSubTitleText(head: 'Date of birth', title: controller.userProfile.value.dob)),
                    10.height,
                    appCard(child: TitleSubTitleText(head: 'Gender', title: controller.userProfile.value.gender)),
                    10.height,
                    appCard(child: TitleSubTitleText(head: 'City', title: controller.userProfile.value.city)),
                    10.height,
                    appCard(child: TitleSubTitleText(head: 'Country', title: controller.userProfile.value.country)),
                    10.height,
                    AppButton(
                        title: 'Setup Profile',
                        onPressed: () {
                          Get.toNamed(AppRoutes.setupProfile);
                        }),
                    10.height,
                  ],
                )),

          ],
        ),
      ),
    );
  }
}
