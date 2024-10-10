import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:health_app/config/routes/app_routes.dart';
import 'package:health_app/config/size_config.dart';
import 'package:health_app/config/theme/app_colors.dart';
import 'package:health_app/config/theme/button_styles.dart';
import 'package:health_app/constant/app_key_contant.dart';
import 'package:health_app/utils/app_print.dart';
import 'package:health_app/widget/app_appbar.dart';
import 'package:health_app/widget/app_button.dart';
import 'package:health_app/widget/app_scaffold.dart';
import 'package:health_app/widget/app_text.dart';

import '../../../widget/app_widgets.dart';

class OtpScreenView extends StatefulWidget {
  OtpScreenView({super.key});

  @override
  State<OtpScreenView> createState() => _OtpScreenViewState();
}

class _OtpScreenViewState extends State<OtpScreenView> {
  bool isOtpButtonDisabled = true; // Initially, button is disabled
  bool isResendButtonDisabled = true; // Initially, resend button is disabled
  int seconds = 30; // Initial timer value
  late Timer timer;
  String otpCode = '';
  int otpLength = 5;

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
            appHeaderText('Verification Code'),
            setHeight(20),
            appSubtitleText(
                'Verification Code has been sent to your number please paste it here to verify it'),
            setHeight(20),
            OtpTextField(
              numberOfFields: otpLength,
              borderColor: Theme.of(context).primaryColor,
              showFieldAsBox: true,
              fieldWidth: setWidthValue(150),
              fieldHeight: setWidthValue(150),
              borderRadius: BorderRadius.circular(setWidthValue(10)),
              onCodeChanged: (String code) {},
              onSubmit: (String code) {
                otpCode = code;
                checkOtpFields();
              }, // end onSubmit
            ),
            setHeight(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(title: '$seconds seconds'),
                setWidth(10),
                GestureDetector(
                  onTap: isResendButtonDisabled ? null : resendOtp,
                  child: AppText(
                    title: 'Resend Code?',
                    decoration: TextDecoration.underline,
                    color: isResendButtonDisabled
                        ? Colors.grey
                        : Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
            setHeight(30),
            isOtpButtonDisabled
                ? SizedBox()
                : AppButton(
                    title: 'Continue',
                    onPressed: () {
                      // Get.toNamed(AppRoutes.setupProfile);
                      Get.toNamed(AppRoutes.app);
                    })
          ],
        ),
      ),
    );
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds > 0) {
          seconds--;
        } else {
          isResendButtonDisabled = false;
          appDebugPrint(isResendButtonDisabled);
          timer.cancel(); // Stop the timer
        }
      });
    });
  }

  void resendOtp() {
    setState(() {
      seconds = 30;
      isResendButtonDisabled = true;
      startTimer();
    });
  }

  void checkOtpFields() {
    setState(() {
      isOtpButtonDisabled = otpCode.length != otpLength;
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
