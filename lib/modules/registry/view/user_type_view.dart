import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/constant/app_key_contant.dart';
import 'package:health_app/widget/app_button.dart';
import 'package:health_app/widget/app_checkbox.dart';
import 'package:health_app/widget/app_chips.dart';
import 'package:health_app/widget/app_scaffold.dart';
import '../../../config/routes/app_routes.dart';
import '../../../config/size_config.dart';
import '../../../widget/app_appbar.dart';
import '../../../widget/app_widgets.dart';

class UserTypeView extends StatefulWidget {
  UserTypeView({super.key});

  @override
  State<UserTypeView> createState() => _UserTypeViewState();
}

class _UserTypeViewState extends State<UserTypeView> {
  bool isPatient = false;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        // appBar: appBar(context, action: setWidth(0)),
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          50.height,
          appHeaderText('Select User Type'),
          50.height,
          appSubtitleText(
            'Before you begin, please let us know what type of user you are.',
          ),
          30.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppChips(
                  label: 'Patient',
                  value: isPatient,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  fontSize: 18,
                  onTap: (value) {
                    setState(() {
                      if (value) {
                        isPatient = value;
                      }
                      // else{
                      //   isPatient = false;
                      // }
                    });
                  }),
              AppChips(
                  label: 'Doctor',
                  value: !isPatient,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  fontSize: 18,
                  onTap: (value) {
                    setState(() {
                      if (value) {
                        isPatient = !value;
                      }
                      // else{
                      //   isPatient = true;
                      // }
                    });
                  })
            ],
          ),
          50.height,
          AppButton(
              title: "Let's go..",
              onPressed: () {
                Get.toNamed(AppRoutes.login);
              })
        ],
      ),
    ));
  }
}
