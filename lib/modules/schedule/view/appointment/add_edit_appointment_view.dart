import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_app/config/size_config.dart';
import 'package:health_app/constant/app_key_contant.dart';
import 'package:health_app/widget/app_appbar.dart';
import 'package:health_app/widget/app_button.dart';
import 'package:health_app/widget/app_input_field.dart';
import 'package:health_app/widget/app_scaffold.dart';
import 'package:health_app/widget/app_text.dart';
import '../../../../utils/date_selection.dart';
import '../../../../widget/app_checkbox.dart';

class AddEditAppointmentView extends StatelessWidget {
  AddEditAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: appBar(context, titleText: 'Add Appointment'),
      body: Padding(
        padding: const EdgeInsets.all(AppSizeConstant.kPadding),
        child: Column(
          children: [
            AppInputField(
              hintText: 'Doctor Name',
              onChanged: (value) {},
              labelText: 'Doctor Name',
            ),
            setHeight(10),
            AppInputField(
              hintText: 'Hospital',
              onChanged: (value) {},
              labelText: 'Hospital Name',
            ),
            setHeight(10),
            AppInputField(
              hintText: 'Description',
              onChanged: (value) {},
              labelText: 'Description',
            ),
            setHeight(10),
            AppInputField(
              hintText: 'Hospital Address',
              onChanged: (value) {},
              labelText: 'Address',
            ),
            setHeight(10),
            GestureDetector(
              onTap: () async {
                DateTime? pickedDateTime = await pickDateTime(context);
                if (pickedDateTime != null) {
                  // Do something with the selected date and time
                  print('Selected DateTime: $pickedDateTime');
                }
              },
              child: AppInputField(
                hintText: 'this is the time',
                onChanged: (value) {},
                labelText: 'Address',
                enable: false,
              ),
            ),
            setHeight(10),
            AppLabeledCheckbox(
              label: 'Notify Me',
              value: true,
              onChanged: (value) {},
              centerPadding: 10,
            ),
            Spacer(),
            AppButton(title: 'Save', onPressed: () {}),
            setHeight(20),
          ],
        ),
      ),
    );
  }
}
