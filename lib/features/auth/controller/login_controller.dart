import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:status_app/core/constants/enums.dart';
import 'package:status_app/core/functions/check_internet.dart';
import 'package:status_app/core/functions/snack_bar.dart';
import 'package:status_app/core/routes/app_routes.dart';
import 'package:status_app/core/services/shared_prefrences_services.dart';
import 'package:status_app/data/auth_repository.dart';
import 'package:status_app/data/user_repository.dart';
import 'package:status_app/features/auth/models/user_model.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find<LoginController>();

  late TextEditingController email, password;
  late Rx<StatusRequest> statusRequest;
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final AuthRepository _authRepository = AuthRepository.instance;
  final UserRepository _userRepository = UserRepository.instance;
  final userService = Get.find<UserService>();

  Future<void> login() async {
    try {
      if (!formState.currentState!.validate()) {
        statusRequest.value = StatusRequest.notValidate;
        return;
      }
      if (!await checkInternet()) {
        statusRequest.value = StatusRequest.offline;
        return;
      }
      statusRequest.value = StatusRequest.loading;
      await _authRepository.logInWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );
      final UserModel userData = await _userRepository.getUserData();
      log(userData.email);
      userService.saveUser(userData);
      Get.offAllNamed(AppRoutes.home);
      statusRequest.value = StatusRequest.success;
    } catch (e) {
      showErrorSnackbar('Error', e.toString());
    }
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.none.obs;
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}
