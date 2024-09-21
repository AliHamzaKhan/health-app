


import 'package:flutter/material.dart';
import 'package:health_app/config/size_config.dart';
import 'package:health_app/widget/app_appbar.dart';
import 'package:health_app/widget/app_scaffold.dart';

class TermsConditionView extends StatelessWidget {
  const TermsConditionView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: HaAppBar(
        titleText: 'Terms and Conditions',
        actionWidget: setWidth(30),
      ),
    );
  }
}
