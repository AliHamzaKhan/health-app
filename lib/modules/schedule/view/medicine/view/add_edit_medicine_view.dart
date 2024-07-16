


import 'package:flutter/material.dart';
import 'package:health_app/widget/app_scaffold.dart';

import '../../../../../config/size_config.dart';
import '../../../../../constant/app_key_contant.dart';
import '../../../../../utils/date_selection.dart';
import '../../../../../widget/app_appbar.dart';
import '../../../../../widget/app_button.dart';
import '../../../../../widget/app_checkbox.dart';
import '../../../../../widget/app_input_field.dart';

class AddEditMedicineView extends StatelessWidget {
  const AddEditMedicineView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: appBar(context, titleText: 'Add Medicine'),
      body: Padding(
        padding: const EdgeInsets.all(
            AppSizeConstant.kPadding
        ),
        child: Column(
          children: [
            AppInputField(hintText: 'Medicine Name', onChanged: (value){}, labelText: 'Medicine Name',),
            setHeight(10),
            AppInputField(hintText: 'Description', onChanged: (value){}, labelText: 'Description',),
            setHeight(10),
            AppLabeledCheckbox(
              label: 'Notify Me',
              value: true,
              onChanged: (value){},
              centerPadding: 10,
            ),
            Spacer(),
            AppButton(title: 'Save', onPressed: () async{
              DateTime? pickedDateTime = await pickDateTime(context);
              if (pickedDateTime != null) {
                // Do something with the selected date and time
                print('Selected DateTime: $pickedDateTime');
              }
            }),
            setHeight(20),
          ],
        ),
      ),
    );
  }
}
