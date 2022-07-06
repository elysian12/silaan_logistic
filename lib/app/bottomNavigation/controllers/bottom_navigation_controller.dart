import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silaan_logistic/app/data/services/shared_services.dart';

import '../../modules/home/views/widgets/delivery_bottom_sheet.dart';

class BottomNavigationController extends GetxController {
  var tabIndex = 0.obs;

  void changePage(int index) {
    if (index != tabIndex.value) {
      tabIndex.value = index;
    }
  }

  showBottomSheet() async {
    String? role = await SharedService().getSharedRole();

    if (role != null && role == 'deliveryExecutive') {
      Get.bottomSheet(
        DeliveryBottomSheet(),
        shape: RoundedRectangleBorder(),
      );
    } else {
      Get.bottomSheet(
        FemaleBottomSheet(),
        shape: RoundedRectangleBorder(),
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
