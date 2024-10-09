import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:health_app/config/services/data_parser_service.dart';
import 'package:health_app/widget/app_chips.dart';
import 'package:health_app/widget/app_scaffold.dart';
import '../../../widget/app_appbar.dart';
import '../../../widget/app_card.dart';
import '../controller/tokens_used_controller.dart';

class TokensUsedView extends StatelessWidget {
  TokensUsedView({super.key});

  var controller = Get.put(TokensUsedController());

  @override
  Widget build(BuildContext context) {
    controller.getUsedTokens();
    return AppScaffold(
      appBar: HaAppBar(
        titleText: 'Tokens Used',
        actionType: AppBarActionType.Custom,
        actionWidget: Obx(()=>AppChips(label: dataParser.getFormatPricing(controller.totalUsedTokensCount.value), value: true, onTap: null,)),
      ),
      body: Obx(()=>ListView.builder(
          itemCount: controller.tokensUsedList.length,
          itemBuilder: (context, index) {
            var model = controller.tokensUsedList[index];
            return TokensUsedCard(
              model: model,
            );
          })),
    );
  }
}
