import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silaan_logistic/app/common/utils/utils.dart';
import 'package:silaan_logistic/app/data/services/shared_services.dart';
import 'package:silaan_logistic/app/routes/app_pages.dart';

import '../../../data/methods/firestore_methods.dart';

class LoginController extends GetxController {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  //INTIAl Value
  String otpCode = '123456';
  String mobile = '123456';
  String? _verificationId;

  //state
  RxBool isLoading = false.obs;
  // bool isSignup = false;

  //Methods
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FireStoreMethods _fireStoreMethods = FireStoreMethods();

  //functions
  void sendOTP(String mobile, BuildContext context) async {
    isLoading.value = true;
    await _auth.verifyPhoneNumber(
      phoneNumber: '+91' + mobile,
      verificationCompleted: (phoneAuthCredential) {
        signInWithPhone(phoneAuthCredential, context);
      },
      verificationFailed: (error) {
        isLoading.value = false;
        log(error.message!);
        showSnackBar(context, error.message!);
      },
      codeSent: (verificationId, forceResendingToken) {
        isLoading.value = false;
        _verificationId = verificationId;
        showSnackBar(context, 'Code sent SuccessFully');
        Get.toNamed(Routes.OTP);
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  void verifyOTP(String otp, BuildContext context) async {
    isLoading.value = true;
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId!,
      smsCode: otp,
    );
    signInWithPhone(credential, context);
  }

  void signInWithPhone(
      PhoneAuthCredential credential, BuildContext context) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        var res = await _fireStoreMethods.checkUser(_auth.currentUser!);
        if (res != null) {
          isLoading.value = false;
          mobileController.clear();
          Get.toNamed(Routes.BOTTOM_NAVIGATION);
          SharedService().setSharedUUID(userCredential.user!.uid);
          SharedService().setSharedRole(res.role!);
          showSnackBar(context, 'Welcome ${res.name}');
        } else {
          isLoading.value = false;
          mobileController.clear();
          otpController.clear();
          showSnackBar(context, 'Login Credentials did not match');
          Get.offAllNamed(Routes.LOGIN);
        }
      }
    } on FirebaseAuthException catch (ex) {
      isLoading.value = false;
      log(ex.message!);
      showSnackBar(context, ex.message!);
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
