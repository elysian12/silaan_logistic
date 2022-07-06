import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:silaan_logistic/app/common/utils/utils.dart';
import 'package:silaan_logistic/app/data/methods/firestore_methods.dart';
import 'package:silaan_logistic/app/data/services/shared_services.dart';
import 'package:silaan_logistic/app/modules/home/models/order_model.dart';
import 'package:silaan_logistic/app/modules/home/views/widgets/verify_otp_view.dart';
import 'package:silaan_logistic/app/routes/app_pages.dart';

class HomeController extends GetxController {
  TextEditingController otpController = TextEditingController();

  Rx<List<OrderModel>> _orders = Rx<List<OrderModel>>([]);

  //getters
  List<OrderModel> get orders => _orders.value;

  //INTIAl Value
  String otpCode = '123456';
  String mobile = '123456';
  String? _verificationId;

  //state
  RxBool isLoading = false.obs;

  //Methods
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Methods
  FireStoreMethods _fireStoreMethods = FireStoreMethods();

  String role = '';
  bool isFemaleExecutive = false;

  //functions
  setRole() async {
    role = (await SharedService().getSharedRole())!;
    isFemaleExecutive = (role == 'femaleExecutive');
    update();
  }

  void sendOTP(String mobile, BuildContext context) async {
    isLoading.value = true;
    await _auth.verifyPhoneNumber(
      phoneNumber: '+91' + mobile,
      verificationCompleted: (phoneAuthCredential) {
        pickUp(phoneAuthCredential, context);
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
        Get.to(() => VerifyOtpView());
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
    pickUp(credential, context);
  }

  void pickUp(PhoneAuthCredential credential, BuildContext context) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        if (role == 'femaleExecutive') {
          isLoading.value = false;
          Get.toNamed(Routes.MEASUREMENT);
        } else {
          isLoading.value = false;
          Get.offAllNamed(Routes.BOTTOM_NAVIGATION);
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
    _orders.bindStream(_fireStoreMethods.getAllOrders());
    setRole();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    _orders.close();
  }
}
