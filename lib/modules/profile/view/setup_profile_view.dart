import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:health_app/constant/app_key_contant.dart';
import 'package:health_app/constant/assets_contant.dart';
import 'package:health_app/constant/dummy_data.dart';
import 'package:health_app/widget/app_alerts.dart';
import 'package:health_app/widget/app_button.dart';
import 'package:health_app/widget/app_image.dart';
import 'package:health_app/widget/app_input_field.dart';
import 'package:health_app/widget/app_text.dart';
import '../../../config/enums/user_type_enum.dart';
import '../../../config/size_config.dart';
import '../../../utils/date_selection.dart';
import '../../../widget/app_appbar.dart';
import '../../../widget/app_dropdown.dart';
import '../../../widget/app_scaffold.dart';
import '../controller/profile_controller.dart';

class SetupProfileView extends StatelessWidget {
  SetupProfileView({super.key});

  var controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: HaAppBar(
        actionWidget: setWidth(30),
        titleText: "",
      ),
      body: Obx(()=>SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            AppText(
              title: "Let's Setup your profile",
              textType: TextTypeEnum.Bold,
            ),
            20.height,
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: ImageDisplay(
                      image: AssetsConstant.userProfileImage,
                      size: Size(100, 100)),
                ),
                Positioned(
                  right: 10,
                  bottom: 0,
                  child: AppIconButton(
                    icon: AssetsConstant.edit,
                    onTap: () {},
                    iconColor: Colors.white,
                  ),
                )
              ],
            ),
            20.height,
            appInputWithCustomLabel(
                label: '*First Name',
                onChanged: (value) {
                  controller.userProfile.value.firstName = value;
                },
                controller: TextEditingController(
                    text: controller.userProfile.value.firstName),
                focusNode: FocusNode()),
            appInputWithCustomLabel(
                label: '*First Name',
                onChanged: (value) {
                  controller.userProfile.value.lastName = value;
                },
                controller: TextEditingController(
                    text: controller.userProfile.value.lastName),
                focusNode: FocusNode()),
            appInputWithCustomLabel(
                label: '*Email',
                onChanged: (value) {
                  controller.userProfile.value.email = value;
                },
                controller: TextEditingController(
                    text: controller.userProfile.value.email),
                focusNode: FocusNode()),
            appDateSelectionWidget(
                context: context,
                label: '*Date of birth',
                labelSize: 12,
                initialDate: DateTime.now(),
                date: controller.userProfile.value.dob,
                onSelectedDate: (date) {
                  controller.userProfile.value.dob = date;
                }),
            appDropDownWithCustomLabel(
                label: 'Gender',
                items: ['Male', 'Female', 'Other'],
                value: controller.userProfile.value.gender,
                onSelected: (value) {
                  controller.userProfile.value.gender = value;
                  controller.userProfile.refresh();
                }),
            appDropDownWithCustomLabel(
                label: 'Country',
                items: countries,
                value: controller.userProfile.value.country,
                onSelected: (value) {
                  controller.userProfile.value.country = value;
                  controller.userProfile.refresh();
                }),
            appDropDownWithCustomLabel(
                label: 'User Type',
                items: ['Patient', 'Doctor'],
                value: getUserTypeNameFromId(
                    controller.userProfile.value.userTypeId),
                onSelected: (value) {
                  UserTypeEnum selectedUserType = convertUserTypeNameToEnum(value);
                  controller.userProfile.value.userTypeId = getUserTypeIdFromEnum(selectedUserType);
                  controller.userProfile.refresh();
                }),
            20.height,
            AppButton(title: 'Setup', onPressed: () {
              if(controller.userProfile.value.isProfileEmpty()){
                appAlerts.customAlert(
                    title: 'Error',
                    subTitle: 'Please fill add fields'
                );
              }else{
                controller.saveProfile();
              }

            })
          ],
        ),
      )),
    );
  }
}
