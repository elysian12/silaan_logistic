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
          .collection('LogisticUsers') // Tailors
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

  Future<void> updateName(String name) async {
    try {
      await _firebaseFirestore
          .collection('LogisticUsers')
          .doc(_authMethods.currentUser!.uid)
          .update(
        {'name': name},
      );
    } on FirebaseException catch (e) {
      log(e.message!);
      return null;
    }
  }

  Future<void> updateAvailability(List<Availability> avail) async {
    try {
      await _firebaseFirestore
          .collection('LogisticUsers')
          .doc(_authMethods.currentUser!.uid)
          .update(
        {'availability': avail.map((e) => e.toMap()).toList()},
      );
    } on FirebaseException catch (e) {
      log(e.message!);
      return null;
    }
  }

  Future<void> updateOrderStatus(String orderId, Status status) async {
    var ref = await _firebaseFirestore
        .collection('orders')
        .where('orderID', isEqualTo: orderId);

    var snap = await ref.get();
    OrderModel order = OrderModel.fromSnapShot(snap.docs[0]);
    order.orderStatus = status;

    await _firebaseFirestore
        .collection('orders')
        .doc(snap.docs[0].reference.id)
        .update(
          order.toMap(),
        );
  }

  Future<void> declineOrder(String orderId) async {
    var ref = await _firebaseFirestore
        .collection('orders')
        .where('orderID', isEqualTo: orderId);

    var snap = await ref.get();
    OrderModel order = OrderModel.fromSnapShot(snap.docs[0]);

    order.rejectionsId.add(_authMethods.currentUser!.uid);

    await _firebaseFirestore
        .collection('orders')
        .doc(snap.docs[0].reference.id)
        .update(
          order.toMap(),
        );
  }

  Stream<List<OrderModel>> getAllOrders(bool isFemale) {
    if (isFemale) {
      return _firebaseFirestore
          .collection('orders')
          .where('measurements', isNull: true)
          .snapshots()
          .map((querySnap) {
        List<OrderModel> _orders = [];

        querySnap.docs.forEach((element) {
          var temp = OrderModel.fromSnapShot(element);
          log(temp.rejectionsId.length.toString());
          if (temp.rejectionsId.contains(_authMethods.currentUser!.uid)) {
            log(_authMethods.currentUser!.uid);
            return;
          } else {
            _orders.add(temp);
          }
        });

        return _orders;
      });
    } else {
      return _firebaseFirestore
          .collection('orders')
          .where(
            'orderStatus',
            whereIn: [
              Status.accepted.name,
              Status.ready.name,
            ],
          )
          .snapshots()
          .map((querySnap) {
            List<OrderModel> _orders = [];

            querySnap.docs.forEach((element) {
              var temp = OrderModel.fromSnapShot(element);
              if (temp.rejectionsId.contains(_authMethods.currentUser!.uid)) {
                return;
              } else {
                _orders.add(temp);
              }
            });

            return _orders;
          });
    }
  }

  Future<void> addDummyOrders(OrderModel model) async {
    await _firebaseFirestore.collection('orders').doc().set(
          model.toMap(),
        );
  }
}
