import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FireStorageMethods {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<String?> uploadProfilePhoto(File file, String uuid) async {
    String? imgUrl;
    var ext = file.path.split('.').last;
    log('@@ this is extension : $ext');
    try {
      await firebase_storage.FirebaseStorage.instance
          .ref('profile/$uuid.$ext')
          .putFile(file);
      imgUrl = await storage.ref('profile/$uuid.$ext').getDownloadURL();
    } on FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
      print(e.message);
    }
    return imgUrl;
  }
}
