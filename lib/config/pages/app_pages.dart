import 'package:get/get.dart';
import 'package:health_app/modules/allergy/view/allergy_detection_view.dart';
import 'package:health_app/modules/app/view/app_view.dart';
import 'package:health_app/modules/blood_test/view/blood_test_view.dart';
import 'package:health_app/modules/bmi/view/bmi_view.dart';
import 'package:health_app/modules/calories/view/calories_view.dart';
import 'package:health_app/modules/ecg/view/ecg_view.dart';
import 'package:health_app/modules/find_doctor/view/find_doctor_view.dart';
import 'package:health_app/modules/find_hospital/view/find_hospital_view.dart';
import 'package:health_app/modules/home/view/home_view.dart';
import 'package:health_app/modules/medicine/view/medicine_view.dart';
import 'package:health_app/modules/monitor_sugar/view/monitor_sugar_view.dart';
import 'package:health_app/modules/onBoarding/view/on_boarding_view.dart';
import 'package:health_app/modules/radiology/view/radiology_view.dart';
import 'package:health_app/modules/registry/view/otp_screen_view.dart';
import '../../modules/ai_process/ai_process_listing/view/ai_process_listing_view.dart';
import '../../modules/ai_process/view_ai_process/view/ai_process_view.dart';
import '../../modules/profile/view/profile_view.dart';
import '../../modules/profile/view/setup_profile_view.dart';
import '../../modules/registry/view/user_type_view.dart';
import '../../modules/splash/view/splash_view.dart';
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
      name: AppRoutes.onBoarding,
      page: () => OnBoardingView(),
      transition: appTransition,
      transitionDuration: screenDuration,
    ),
    GetPage(
      name: AppRoutes.userType,
      page: () => UserTypeView(),
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
      name: AppRoutes.app,
      page: () => AppView(),
      transition: appTransition,
      transitionDuration: screenDuration,
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfileView(),
      transition: appTransition,
      transitionDuration: screenDuration,
    ),
    GetPage(
      name: AppRoutes.setupProfile,
      page: () => SetupProfileView(),
      transition: appTransition,
      transitionDuration: screenDuration,
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      transition: appTransition,
      transitionDuration: screenDuration,
    ),
    GetPage(
      name: AppRoutes.aiProcess,
      page: () => AiProcessView(),
      transition: appTransition,
      transitionDuration: screenDuration,
    ),
    GetPage(
      name: AppRoutes.aiProcessListing,
      page: () => AiProcessListingView(),
      transition: appTransition,
      transitionDuration: screenDuration,
    ),
    GetPage(
      name: AppRoutes.ecg,
      page: () => EcgView(),
      transition: appTransition,
      transitionDuration: screenDuration,
    ),
    GetPage(
      name: AppRoutes.bmi,
      page: () => BmiView(),
      transition: appTransition,
      transitionDuration: screenDuration,
    ),
    GetPage(
      name: AppRoutes.bloodTest,
      page: () => BloodTestView(),
      transition: appTransition,
      transitionDuration: screenDuration,
    ),
    GetPage(
      name: AppRoutes.allergyDetection,
      page: () => AllergyDetectionView(),
      transition: appTransition,
      transitionDuration: screenDuration,
    ),
    GetPage(
      name: AppRoutes.radiology,
      page: () => RadiologyView(),
      transition: appTransition,
      transitionDuration: screenDuration,
    ),
    GetPage(
      name: AppRoutes.medicine,
      page: () => MedicineView(),
      transition: appTransition,
      transitionDuration: screenDuration,
    ),
    GetPage(
      name: AppRoutes.calories,
      page: () => CaloriesView(),
      transition: appTransition,
      transitionDuration: screenDuration,
    ),
    GetPage(
      name: AppRoutes.findDoctor,
      page: () => FindDoctorView(),
      transition: appTransition,
      transitionDuration: screenDuration,
    ),
    GetPage(
      name: AppRoutes.monitorSugar,
      page: () => MonitorSugarView(),
      transition: appTransition,
      transitionDuration: screenDuration,
    ),
    GetPage(
      name: AppRoutes.findHospital,
      page: () => FindHospitalView(),
      transition: appTransition,
      transitionDuration: screenDuration,
    ),
  ];
}
