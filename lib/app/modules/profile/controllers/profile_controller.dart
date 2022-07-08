import 'dart:developer';

import 'package:get/get.dart';
import 'package:silaan_logistic/app/data/methods/firebase_auth_methods.dart';
import 'package:silaan_logistic/app/data/methods/firestore_methods.dart';
import 'package:silaan_logistic/app/data/models/profile_model.dart';
import 'package:silaan_logistic/app/data/services/shared_services.dart';
import 'package:silaan_logistic/app/modules/home/controllers/home_controller.dart';
import 'package:silaan_logistic/app/modules/report/controllers/report_controller.dart';
import 'package:silaan_logistic/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  //models
  ProfileModel profileModel = ProfileModel();

  //methods
  FireStoreMethods _fireStoreMethods = FireStoreMethods();
  FirebaseAuthMethods _authMethods = FirebaseAuthMethods();

  //state
  RxBool isLoading = false.obs;

  //intial
  DateTime today = DateTime.now();
  List<String> availabilities = [
    'UnAvailable',
    'UnAvailable',
    'UnAvailable',
  ];

  List<String> availability = [
    'Available',
    'UnAvailable',
  ];

  //functions
  void getProfile() async {
    isLoading.value = true;

    var res = await _fireStoreMethods.getPofile();

    if (res != null) {
      profileModel = res;

      for (var i = 0; i < profileModel.availability!.length; i++) {
        if (profileModel.availability![i].isAvailable!) {
          availabilities[i] = 'Available';
        } else {
          availabilities[i] = 'UnAvailable';
        }
      }

      isLoading.value = false;
    }
    update();
  }

  void changeMorningSlot(index, value) {
    availabilities[index] = value;
    if (value == 'Available') {
      profileModel.availability![index].isAvailable = true;
      _fireStoreMethods.updateAvailability(
        profileModel.availability!,
      );
    } else {
      profileModel.availability![index].isAvailable = false;
      _fireStoreMethods.updateAvailability(
        profileModel.availability!,
      );
    }
    update();
  }

  void changeDate(value) {
    today = value;
    update();
  }

  void updateName(String name) async {
    await _fireStoreMethods.updateName(name);
    getProfile();
  }

  void logOut() async {
    _authMethods.signOut();
    await SharedService().removeSharedServices();
    Get.offAllNamed(Routes.LOGIN);
    Get.delete<ProfileController>();
    Get.delete<HomeController>();
  }

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
