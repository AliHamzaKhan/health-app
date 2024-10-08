import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_app/config/size_config.dart';
import 'package:health_app/constant/app_key_contant.dart';
import 'package:health_app/constant/assets_contant.dart';
import 'package:health_app/widget/app_card.dart';
import 'package:health_app/widget/app_scaffold.dart';
import 'package:health_app/widget/app_text.dart';

import '../../../widget/app_appbar.dart';
import '../../../widget/app_bottom_nav_bar.dart';
import '../../../widget/app_carousel_slider.dart';
import '../../../widget/app_drawer.dart';
import '../../../widget/app_widgets.dart';
import '../controller/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  var controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      scaffoldKey: controller.scaffoldKey,
      appBar: HaAppBar(
        appBarType: AppBarType.Menu,
        onMenuClick: () {
          controller.openDrawer();
        },
        titleWidget: appIconImage(size: Size(200, 200)),
      ),
      body: SingleChildScrollView(
        padding: appPadding,
        child: Column(
          children: [
            tokenUsed(context),
            latestNewInCity(context),
            nearbyHospitals(context),
            topDoctors(context),
            sugarReport(context)
          ],
        ),
      ),
      drawer: AppDrawer(),
    );
  }

  Widget tokenUsed(context) {
    return Align(
      alignment: Alignment.centerRight,
      child: IntrinsicWidth(
          child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: setWidthValue(30), vertical: 5),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: TitleSubTitleText(
                head: 'Token Used',
                title: '1000',
                headColor: Theme.of(context).scaffoldBackgroundColor,
                titleColor: Theme.of(context).scaffoldBackgroundColor,
              ))),
    );
  }

  Widget latestNewInCity(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appSubtitleText('Latest New:'),
        5.height,
        AppCarouselSlider(
          items: [
            LatestNewsCard(),
          ],
        ),
      ],
    );
  }

  Widget nearbyHospitals(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appSubtitleText('Nearby Hospitals'),
        5.height,
        AppCarouselSlider(
          items: [
            Container(
              width: Get.width,
              color: Colors.red,
            ),
            Container(
              width: Get.width,
              color: Colors.black,
            ),
            Container(
              width: Get.width,
              color: Colors.amberAccent,
            ),
            Container(
              width: Get.width,
              color: Colors.blueAccent,
            ),
          ],
        ),
      ],
    );
  }

  Widget topDoctors(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appSubtitleText('Top Doctors:'),
        5.height,
        AppCarouselSlider(
          items: [
            Container(
              width: Get.width,
              color: Colors.red,
            ),
            Container(
              width: Get.width,
              color: Colors.black,
            ),
            Container(
              width: Get.width,
              color: Colors.amberAccent,
            ),
            Container(
              width: Get.width,
              color: Colors.blueAccent,
            ),
          ],
        ),
      ],
    );
  }

  Widget sugarReport(BuildContext context) {
    return Container();
  }
}
