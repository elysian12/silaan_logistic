import 'dart:io';

import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:silaan_logistic/app/data/methods/firebase_auth_methods.dart';
import 'package:silaan_logistic/app/data/methods/firebase_storage_methods.dart';
import 'package:silaan_logistic/app/data/methods/firestore_methods.dart';
import 'package:silaan_logistic/app/data/models/profile_model.dart';
import 'package:silaan_logistic/app/data/services/shared_services.dart';
import 'package:silaan_logistic/app/modules/home/controllers/home_controller.dart';
import 'package:silaan_logistic/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  //  Intial
  File? file;

  //models
  ProfileModel profileModel = ProfileModel();

  //methods
  FireStoreMethods _fireStoreMethods = FireStoreMethods();
  FirebaseAuthMethods _authMethods = FirebaseAuthMethods();
  FireStorageMethods _methods = FireStorageMethods();

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

  void updateProfile() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      cropProfilePic(File(pickedFile.path));
      var imgUrl = await _methods.uploadProfilePhoto(
          File(pickedFile.path), _authMethods.currentUser!.uid);
      _fireStoreMethods.updateProfile(imgUrl!);
    }
  }

  void cropProfilePic(File profile) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: profile.path,
      compressQuality: 10,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
    );
    if (croppedFile != null) {
      file = File(croppedFile.path);
      getProfile();
    }
    update();
  }

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
    await _authMethods.signOut();
    await SharedService().removeSharedServices();
    Get.offAllNamed(Routes.LOGIN);
    Get.delete<ProfileController>();
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
