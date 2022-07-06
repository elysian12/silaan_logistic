import 'package:get/get.dart';
import 'package:silaan_logistic/app/bottomNavigation/bindings/bottom_navigation_binding.dart';
import 'package:silaan_logistic/app/bottomNavigation/views/bottom_navigation_view.dart';
import 'package:silaan_logistic/app/modules/home/views/measurement_view.dart';
import 'package:silaan_logistic/app/modules/login/views/otp_view.dart';
import 'package:silaan_logistic/app/modules/profile/views/aboutus_view.dart';
import 'package:silaan_logistic/app/modules/profile/views/terms_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/report/bindings/report_binding.dart';
import '../modules/report/views/report_view.dart';
import '../splash/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MEASUREMENT,
      page: () => MeasurementView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAVIGATION,
      page: () => BottomNavigationView(),
      binding: BottomNavigationBinding(),
    ),
    GetPage(
      name: _Paths.REPORT,
      page: () => ReportView(),
      binding: ReportBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.TERMS,
      page: () => TermsAndConditionView(),
    ),
    GetPage(
      name: _Paths.ABOUTUS,
      page: () => AboutUsView(),
    ),
  ];
}
