import 'package:get/get.dart';
import '../routes/app_routes.dart';

abstract class AppPages {
  static String initialRoute = AppRoutes.splash;
  static Transition appTransition = Transition.fadeIn;
  static Duration screenDuration = const Duration(milliseconds: 300);

  static final pages = <GetPage>[

  ];
}
