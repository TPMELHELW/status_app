import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:status_app/core/functions/snack_bar.dart';
import 'package:status_app/core/routes/app_routes.dart';
import 'package:status_app/data/auth_repository.dart';

class VerifyController extends GetxController {
  static VerifyController get instance => Get.find<VerifyController>();

  final AuthRepository authRepository = Get.put(AuthRepository());
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> sendEmailVerification() async {
    try {
      await authRepository.sendEmailVerification();
    } catch (e) {
      showErrorSnackbar('Error', e.toString());
    }
  }

  Future<void> autoDirect() async {
    Timer.periodic(Duration(seconds: 2), (timer) async {
      await _auth.currentUser!.reload();
      if (_auth.currentUser!.emailVerified) {
        timer.cancel();
        Get.offAllNamed(AppRoutes.login);
        showSuccessSnackbar('Success', 'Your Email has been Verified');
      }
    });
  }

  @override
  void onInit() {
    sendEmailVerification();
    autoDirect();
    super.onInit();
  }
}
