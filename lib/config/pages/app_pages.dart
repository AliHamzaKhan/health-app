import 'package:get/get.dart';
import 'package:health_app/modules/app/view/app_view.dart';
import 'package:health_app/modules/home/view/home_view.dart';
import 'package:health_app/modules/onBoarding/view/on_boarding_view.dart';
import 'package:health_app/modules/registry/view/otp_screen_view.dart';
import '../../modules/onBoarding/view/splash_view.dart';
import '../../modules/registry/view/login_view.dart';
import '../routes/app_routes.dart';

abstract class AppPages {
  static String initialRoute = AppRoutes.splash;
  static Transition appTransition = Transition.fadeIn;
  static Duration screenDuration = const Duration(milliseconds: 300);

  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
      transition: appTransition,
      transitionDuration: screenDuration,
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
      transition: appTransition,
      transitionDuration: screenDuration,
    ),
    GetPage(
      name: AppRoutes.otp,
      page: () => OtpScreenView(),
      transition: appTransition,
      transitionDuration: screenDuration,
    ),

    GetPage(
      name: AppRoutes.onBoarding,
      page: () => OnBoardingView(),
      transition: appTransition,
      transitionDuration: screenDuration,
    ),
    GetPage(
      name: AppRoutes.app,
      page: () => AppView(),
      transition: appTransition,
      transitionDuration: screenDuration,
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      transition: appTransition,
      transitionDuration: screenDuration,
    ),
  ];
}
