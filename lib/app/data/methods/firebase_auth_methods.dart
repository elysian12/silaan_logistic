import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthMethods {
  FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
