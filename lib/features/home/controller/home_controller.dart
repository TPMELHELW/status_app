import 'package:animated_emoji/animated_emoji.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_app/core/functions/snack_bar.dart';
import 'package:status_app/core/routes/app_routes.dart';
import 'package:status_app/core/services/shared_prefrences_services.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find<HomeController>();

  late TextEditingController search;

final FirebaseAuth _auth = FirebaseAuth.instance;
  final userService = Get.find<UserService>();

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      Get.offAllNamed(AppRoutes.login);
    } catch (e) {
      showErrorSnackbar('Error', e.toString());
    }
  }

  @override
  void onInit() {
    search = TextEditingController();
    super.onInit();
  }
}
