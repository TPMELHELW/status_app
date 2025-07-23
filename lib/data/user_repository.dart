import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:status_app/core/functions/snack_bar.dart';
import 'package:status_app/core/routes/app_routes.dart';
import 'package:status_app/features/auth/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find<UserRepository>();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance.currentUser;
  void screenRedirect() {
    if (_auth != null) {
      if (_auth.emailVerified) {
        Get.offAllNamed(AppRoutes.home);
      } else {
        Get.offAllNamed(AppRoutes.verify);
      }
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }

  Future<void> saveUserInf(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } catch (e) {
      showErrorSnackbar('Error', e.toString());
    }
  }

  Future<UserModel> getUserData() async {
    try {
      // log(_auth!.uid);
      final data = await _db.collection('Users').doc(_auth!.uid).get();
      // print(data.);
      if (data.exists) {
        // print('exist');
        return UserModel.fromSnapshot(data);
      } else {
        return UserModel.empty();
      }
    } catch (e) {
      // print('error');
      throw Exception(e);
    }
  }

  Future<void> updateUserDetails(UserModel data) async {
    try {
      await _db.collection('Users').doc(_auth!.uid).update(data.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateSingleUserInf(Map<String, dynamic> data) async {
    try {
      await _db.collection('Users').doc(_auth!.uid).update(data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> removeUserData() async {
    try {
      await _db.collection('Users').doc(_auth!.uid).delete();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  void onReady() {
    // FlutterNativeSplash.remove();
    // SystemChrome.setSystemUIOverlayStyle(
    //     const SystemUiOverlayStyle(statusBarColor: Colors.blue));
    screenRedirect();
    super.onReady();
  }

  // Future<String> uploadProfileImage(String path, XFile file) async {
  //   try {
  //     final image = FirebaseStorage.instance.ref(path).child(file.name);
  //     await image.putFile(File(file.path));
  //     final url = await image.getDownloadURL();
  //     return url;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }
}
