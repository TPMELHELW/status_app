// import 'package:e_commerce/features/authentication/screens/login_screen/login_screen.dart';
// import 'package:e_commerce/features/authentication/screens/on_boarding_screen/on_boarding_screen.dart';
// import 'package:e_commerce/features/authentication/screens/signup_screen/verify_screen.dart';
// import 'package:e_commerce/features/shop/screens/navigation_menu_screen/navigation_menu_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
// import 'package:status_app/features/auth/screen/login_screen/login_screen.dart';
// import 'package:status_app/features/auth/screen/signup_screen/verify_screen.dart';
// import 'package:status_app/features/home/screens/home_screen.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();
  // final storage = GetStorage();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance.currentUser;

  Future<UserCredential> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final UserCredential user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }

  Future<void> logInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }

  // Future<UserCredential> googleSignIn() async {
  //   try {
  //     final userAuth = await GoogleSignIn().signIn();

  //     final googleAuth = await userAuth?.authentication;
  //     final credential = GoogleAuthProvider.credential(
  //         accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

  //     return await _auth.signInWithCredential(credential);
  //   } on FirebaseAuthException catch (e) {
  //     throw FirebaseAuthException(code: e.code);
  //   }
  // }

  Future<void> forgetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    }
  }

  // Future<void> deleteAccount() async {
  //   try {
  //     storage.remove('Email');
  //     storage.remove('Password');
  //     await _auth.currentUser!.delete();
  //   } on FirebaseAuthException catch (e) {
  //     throw FirebaseAuthException(code: e.code);
  //   }
  // }

  // Future<void> reAuth(String email, String password) async {
  //   try {
  //     AuthCredential credential = EmailAuthProvider.credential(
  //       email: email,
  //       password: password,
  //     );

  //     await _auth.currentUser!.reauthenticateWithCredential(credential);
  //   } on FirebaseAuthException catch (e) {
  //     throw FirebaseAuthException(code: e.code);
  //   }
  // }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
