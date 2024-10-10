import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/constant/app_key_contant.dart';
import 'package:health_app/widget/app_button.dart';
import 'package:health_app/widget/app_chips.dart';
import 'package:health_app/widget/app_scaffold.dart';
import '../../../config/routes/app_routes.dart';
import '../../../widget/app_widgets.dart';
import '../controller/user_type_controller.dart';

class UserTypeView extends StatelessWidget {
  UserTypeView({super.key});

  var controller = Get.put(UserTypeController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        body: Obx(() => Padding(
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
                  Wrap(
                    spacing: 10,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: controller.userTypeList
                        .map(
                          (e) => AppChips(
                              label: e.userTypeName,
                              value: e.userTypeId ==
                                  controller.selectedUserType.value.userTypeId,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 5),
                              fontSize: 18,
                              onTap: (value) {
                                controller.selectedUserType(e);
                              }),
                        )
                        .toList(),
                  ),
                  50.height,
                  AppButton(
                      title: "Let's go..",
                      onPressed: () {
                        if(controller.selectedUserType.value.userTypeName.isNotEmpty){
                          Get.toNamed(AppRoutes.login, arguments: {
                            'args': controller.selectedUserType.value
                          });
                        }

                      })
                ],
              ),
            )));
  }
}
