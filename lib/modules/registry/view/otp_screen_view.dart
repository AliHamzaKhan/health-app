


import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:health_app/config/routes/app_routes.dart';
import 'package:health_app/config/size_config.dart';
import 'package:health_app/widget/app_button.dart';
import 'package:health_app/widget/app_scaffold.dart';

class OtpScreenView extends StatelessWidget {
  const OtpScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
            //runs when every textfield is filled
            onSubmit: (String verificationCode){
              showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text("Verification Code"),
                      content: Text('Code entered is $verificationCode'),
                    );
                  }
              );
            }, // end onSubmit
          ),
          AppButton(title: 'Continue', onPressed: (){
            Get.toNamed(AppRoutes.app);
          })
        ],
      ),
    );
  }
}
