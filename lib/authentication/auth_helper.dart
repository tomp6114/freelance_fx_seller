import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:freelance_fx_seller/model/user_model.dart';
import 'package:get/get.dart';

import '../view/screens/onboard_screen/onboard_screen.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _DB = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    required String fullName,
    required String mobileNumber,
    required String image,
  }) async {
    String res = 'some error occured';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          fullName.isNotEmpty ||
          mobileNumber.isNotEmpty) {
        final newUser = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        final user = UserModel(
            email: email,
            fullName: fullName,
            mobileNumber: mobileNumber,
            uid: newUser.user!.uid,
            image: image);
        await _DB.collection('users').doc(newUser.user!.uid).set(user.toJson());
        res = 'Sucess';
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'email-already-in-use') {
        res = 'The email address is already in use';
      }
    }
    print(res);
    return res;
  }

  Future<String> signInUser(
      {required String email, required String password}) async {
    String res = 'some error occured';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid);
        });
        res = 'Logged In Sucessfully';
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-password') {
        res = 'Invalid  password';
      }
      if (e.code == 'user-not-found') {
        res = 'User not found';
      }
      if (e.code == 'invalid-email') {
        res = 'Inavlid Email';
      }
    }
    return res;
  }

  Future logoutUser() async {
    await FirebaseAuth.instance
        .signOut()
        .then((value) => Get.offAll(()=>OnBoardScreen()));
  }
}
