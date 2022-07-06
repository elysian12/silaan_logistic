import 'package:get/get.dart';
import 'package:silaan_logistic/app/modules/home/controllers/home_controller.dart';
import 'package:silaan_logistic/app/modules/profile/controllers/profile_controller.dart';
import 'package:silaan_logistic/app/modules/report/controllers/report_controller.dart';

import '../controllers/bottom_navigation_controller.dart';

class BottomNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationController>(
      () => BottomNavigationController(),
    );
    Get.put(
      HomeController(),
    );
    Get.put(
      ProfileController(),
    );
    Get.put(
      ReportController(),
    );
  }
}
