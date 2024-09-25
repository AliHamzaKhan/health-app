import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:health_app/constant/app_key_contant.dart';
import 'package:health_app/constant/assets_contant.dart';
import 'package:health_app/constant/dummy_data.dart';
import 'package:health_app/widget/app_button.dart';
import 'package:health_app/widget/app_image.dart';
import 'package:health_app/widget/app_input_field.dart';
import 'package:health_app/widget/app_text.dart';
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
      body: SingleChildScrollView(
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
                onChanged: (value) {},
                controller: TextEditingController(text: ''),
                focusNode: FocusNode()),
            appInputWithCustomLabel(
                label: '*First Name',
                onChanged: (value) {},
                controller: TextEditingController(text: ''),
                focusNode: FocusNode()),
            appInputWithCustomLabel(
                label: '*Email',
                onChanged: (value) {},
                controller: TextEditingController(text: ''),
                focusNode: FocusNode()),
            appDateSelectionWidget(
                context: context,
                label: '*Date of birth',
                labelSize: 12,
                initialDate: DateTime.now(),
                onSelectedDate: (date) {}),
            appDropDownWithCustomLabel(
                label: 'Gender',
                items: ['Male', 'Female', 'Other'],
                value: '',
                onSelected: (value) {}),
            appDropDownWithCustomLabel(
                label: 'Country',
                items: countries,
                value: '',
                onSelected: (value) {}),
            appDropDownWithCustomLabel(
                label: 'User Type',
                items: ['Patient', 'Doctor'],
                value: '',
                onSelected: (value) {}),
            20.height,
            AppButton(title: 'Setup', onPressed: () {})
          ],
        ),
      ),
    );
  }
}
