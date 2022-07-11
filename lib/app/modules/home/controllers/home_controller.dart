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
  Future<void> setRole() async {
    role = (await SharedService().getSharedRole())!;
    isFemaleExecutive = (role == 'femaleExecutive');
    update();
  }

  void sendOTP(String mobile, BuildContext context, Status status,
      String orderId) async {
    isLoading.value = true;
    await _auth.verifyPhoneNumber(
      phoneNumber: '+91' + mobile,
      verificationCompleted: (phoneAuthCredential) {
        pickUp(phoneAuthCredential, context, status, orderId);
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
        Get.to(() => VerifyOtpView(
              status: status,
              order: orderId,
            ));
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  void verifyOTP(
      String otp, BuildContext context, Status status, String orderId) async {
    isLoading.value = true;
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId!,
      smsCode: otp,
    );
    pickUp(credential, context, status, orderId);
  }

  void pickUp(PhoneAuthCredential credential, BuildContext context,
      Status status, String orderId) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        if (role == 'femaleExecutive') {
          isLoading.value = false;
          Get.toNamed(Routes.MEASUREMENT, arguments: orderId);
        } else {
          isLoading.value = false;
          await _fireStoreMethods.updateOrderStatus(orderId, status);
          Get.offAllNamed(Routes.BOTTOM_NAVIGATION);
        }
      }
    } on FirebaseAuthException catch (ex) {
      isLoading.value = false;
      log(ex.message!);
      showSnackBar(context, ex.message!);
    }
  }

  void rejectOrder(String orderID) async {
    isLoading.value = true;
    await _fireStoreMethods.declineOrder(orderID);
    isLoading.value = false;
  }

  Future<void> updateMeasurement(
      String orderId, Measurements measurements) async {
    await _fireStoreMethods.updateOrderMeasurements(orderId, measurements);
  }

  void getAllorders() async {
    await setRole();
    _orders.bindStream(_fireStoreMethods.getAllOrders(isFemaleExecutive));
  }

  @override
  void onInit() {
    getAllorders();
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
