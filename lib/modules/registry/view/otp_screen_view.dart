import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:health_app/config/routes/app_routes.dart';
import 'package:health_app/config/size_config.dart';
import 'package:health_app/constant/app_key_contant.dart';
import 'package:health_app/widget/app_appbar.dart';
import 'package:health_app/widget/app_button.dart';
import 'package:health_app/widget/app_scaffold.dart';
import 'package:health_app/widget/app_text.dart';

class OtpScreenView extends StatelessWidget {
  const OtpScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: appBar(context, action: setWidth(0)),
      body: Padding(
        padding: const EdgeInsets.all(AppSizeConstant.kPadding),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            setHeight(30),
            AppText(
              title: 'Verification Code',
              textType: TextTypeEnum.Bold,
              fontSize: 20,
            ),
            setHeight(20),
            AppText(
              title: 'Verification Code has been sent to your number please paste it here to verify it',
              textType: TextTypeEnum.Medium,
              overflow: TextOverflow.clip,
            ),
            setHeight(20),
            OtpTextField(
              numberOfFields: 5,
              borderColor: Theme.of(context).primaryColor,
              showFieldAsBox: true,
              fieldWidth: setWidthValue(150),
              fieldHeight: setWidthValue(150),
              borderRadius: BorderRadius.circular(setWidthValue(10)),
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              onSubmit: (String verificationCode) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    });
              }, // end onSubmit
            ),
            setHeight(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(title: '18 seconds'),
                setWidth(10),
                AppText(title: 'Resend Code?', decoration: TextDecoration.underline,)
              ],
            ),
            setHeight(30),
            AppButton(
                title: 'Continue',
                onPressed: () {
                  Get.toNamed(AppRoutes.app);
                })
          ],
        ),
      ),
    );
  }
}
