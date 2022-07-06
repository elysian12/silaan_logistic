import 'dart:developer';

import 'package:get/get.dart';
import 'package:silaan_logistic/app/data/methods/firebase_auth_methods.dart';
import 'package:silaan_logistic/app/data/methods/firestore_methods.dart';
import 'package:silaan_logistic/app/data/models/profile_model.dart';
import 'package:silaan_logistic/app/data/services/shared_services.dart';
import 'package:silaan_logistic/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  //models
  ProfileModel profileModel = ProfileModel();

  //methods
  FireStoreMethods _fireStoreMethods = FireStoreMethods();
  FirebaseAuthMethods _authMethods = FirebaseAuthMethods();

  //state
  RxBool isLoading = false.obs;

  //functions
  void getProfile() async {
    var res = await _fireStoreMethods.getPofile();

    if (res != null) {
      profileModel = res;
      profileModel.availability!.forEach((element) {
        log(element.isAvailable.toString());
        log(element.timeSlot!);
      });
    }
    update();
  }

  void logOut() async {
    _authMethods.signOut();
    await SharedService().removeSharedServices();
    Get.offAllNamed(Routes.LOGIN);
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
