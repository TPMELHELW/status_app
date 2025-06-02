import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_app/core/constants/enums.dart';
import 'package:status_app/core/functions/check_internet.dart';
import 'package:status_app/core/functions/generate_username.dart';
import 'package:status_app/core/functions/snack_bar.dart';
import 'package:status_app/core/routes/app_routes.dart';
import 'package:status_app/data/auth_repository.dart';
import 'package:status_app/data/user_repository.dart';
import 'package:status_app/features/auth/models/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find<SignupController>();

  late TextEditingController fullName, email, password;

  final AuthRepository _authRepository = Get.find<AuthRepository>();
  final UserRepository _userRepository = Get.find<UserRepository>();
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  late Rx<StatusRequest> statusRequest;

  Future<void> signUpWithEmailAndPassword() async {
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

      final user = await _authRepository.signUpWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      final UserModel userData = UserModel(
        id: user.user!.uid,
        name: fullName.text.trim(),
        userName: generateUsername(),
        email: email.text.trim(),
      );
      await _userRepository.saveUserInf(userData);
      Get.offAllNamed(AppRoutes.verify);
      statusRequest.value = StatusRequest.success;
    } catch (e) {
      statusRequest.value = StatusRequest.serverFailure;
      showErrorSnackbar('Error', e.toString());
    }
  }

  @override
  void onInit() {
    fullName = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    statusRequest = StatusRequest.none.obs;
    super.onInit();
  }
}
