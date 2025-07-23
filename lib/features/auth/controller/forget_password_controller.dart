import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:status_app/core/constants/enums.dart';
import 'package:status_app/core/functions/check_internet.dart';
import 'package:status_app/core/functions/snack_bar.dart';
import 'package:status_app/data/auth_repository.dart';

class ForgetPasswordController extends GetxController {
  late TextEditingController email;
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  late Rx<StatusRequest> statusRequest;
  final AuthRepository _authRepository = AuthRepository.instance;

  Future<void> sendResetPassword() async {
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
      await _authRepository.forgetPassword(email.text.trim());
      statusRequest.value = StatusRequest.success;
      showSuccessSnackbar('Success', 'Please Check Your Email');
    } catch (e) {
      statusRequest.value = StatusRequest.serverFailure;

      showErrorSnackbar('Error', e.toString());
    }
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.none.obs;
    email = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    super.onClose();
  }
}
