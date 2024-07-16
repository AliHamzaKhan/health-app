import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/config/routes/app_routes.dart';
import 'package:health_app/config/size_config.dart';
import 'package:health_app/config/theme/button_styles.dart';
import 'package:health_app/constant/assets_contant.dart';
import 'package:health_app/widget/app_button.dart';
import 'package:health_app/widget/app_input_field.dart';
import 'package:health_app/widget/app_scaffold.dart';
import 'package:health_app/widget/app_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/login_controller.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  var controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Padding(
        padding: EdgeInsets.all(setHeightValue(30)),
        child: Column(
          children: [
            setHeight(70),
            AppText(title: 'Login'),
            setHeight(40),
            AppInputField(hintText: 'Phone No', onChanged: (value) {}),
            setHeight(20),
            AppButton(
              title: 'Continue',
              onPressed: () {
                Get.toNamed(AppRoutes.otp);
              },
              buttonStyleClass: ButtonStyleClass(
                  width: Get.width, height: setHeightValue(50)),
            ),
            setHeight(30),
            const Spacer(),
            setHeight(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                iconWidget(
                    title: 'Facebook',
                    image: AssetsConstant.facebook,
                    onClick: () {}),
                iconWidget(
                    title: 'Google',
                    image: AssetsConstant.google,
                    onClick: () {}),
              ],
            ),
            setHeight(70),
            termsAndCondition(context),
            setHeight(30),
          ],
        ),
      ),
    );
  }

  Widget iconWidget({required String title, required String image, required onClick}) {
    return Column(
      children: [
        AppIconButton(
          icon: image,
          onTap: onClick,
        ),
        AppText(title: title)
      ],
    );
  }

  termsAndCondition(context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async {
        final Uri url = Uri.parse('https://pigybak.com/privacy-policy');
        if (!await launchUrl(url)) {
          throw Exception('Could not launch $url');
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                overflow: TextOverflow.clip,
                title: 'By signing in you agree to the ',
              ),
              AppText(
                title: 'Terms of use',
                color: Theme.of(context).primaryColor,
                overflow: TextOverflow.clip,
                textType: TextTypeEnum.Bold,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                  title: ' & ',
                  color: Colors.black,
                  overflow: TextOverflow.clip),
              AppText(
                title: 'Privacy policy',
                color: Theme.of(context).primaryColor,
                overflow: TextOverflow.clip,
                textType: TextTypeEnum.Bold,
              )
            ],
          )
        ],
      ),
    );
  }
}
