import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'config/binding/initial_binding.dart';
import 'config/pages/app_pages.dart';
import 'config/services/auth_service.dart';
import 'config/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  Get.put(AuthService(), permanent: true);
  runApp(const HaApp());
}

class HaApp extends StatefulWidget {
  const HaApp({super.key});

  @override
  State<HaApp> createState() => _HaAppState();
}

class _HaAppState extends State<HaApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightThemeData,
      darkTheme: darkThemeData,
      themeMode: ThemeMode.light,
      defaultTransition: AppPages.appTransition,
      initialRoute: AppPages.initialRoute,
      getPages: AppPages.pages,
      initialBinding: InitialBinding(),
      // home: TestingView(),
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
    );
  }
}

