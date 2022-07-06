import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:silaan_logistic/app/data/methods/firebase_auth_methods.dart';
import 'package:silaan_logistic/app/data/models/profile_model.dart';
import 'package:silaan_logistic/app/modules/home/models/order_model.dart';

class FireStoreMethods {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  FirebaseAuthMethods _authMethods = FirebaseAuthMethods();

  Future<ProfileModel?> checkUser(User user) async {
    ProfileModel? profileModel;

    try {
      var result = await _firebaseFirestore
          .collection('LogisticUsers')
          .doc(user.uid)
          .get();
      if (result.exists) {
        profileModel = ProfileModel.fromSnapShot(result);
      } else {
        profileModel = null;
      }
    } on FirebaseException catch (e) {
      log(e.message!);
    }

    return profileModel;
  }

  Future<ProfileModel?> getPofile() async {
    try {
      var reponse = await _firebaseFirestore
          .collection('LogisticUsers')
          .doc(_authMethods.currentUser!.uid)
          .get();

      var res = ProfileModel.fromSnapShot(reponse);
      return res;
    } on FirebaseException catch (e) {
      log(e.message!);
      return null;
    }
  }

  Stream<List<OrderModel>> getAllOrders() {
    return _firebaseFirestore.collection('orders').snapshots().map((querySnap) {
      List<OrderModel> _orders = [];

      querySnap.docs.forEach((element) {
        _orders.add(OrderModel.fromSnapShot(element));
      });

      return _orders;
    });
  }
}
