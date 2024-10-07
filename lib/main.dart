import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:health_app/firebase_options.dart';
import 'config/binding/initial_binding.dart';
import 'config/pages/app_pages.dart';
import 'config/auth/auth_service.dart';
import 'config/theme/app_theme.dart';
import 'package:alarm/alarm.dart';

late final FirebaseApp app;
late final FirebaseAuth auth;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  setSystemPreference();
  await setupFirebase();
  await Alarm.init();
  await dotenv.load(fileName: ".env");
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

Future setupFirebase() async {
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);
}
void setSystemPreference() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      statusBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true; // Accept all certificates
  }
}