import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:status_app/core/constants/enums.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find<LoginController>();

  late TextEditingController email, password;
  late Rx<StatusRequest> statusRequest;

  @override
  void onInit() {
    statusRequest = StatusRequest.none.obs;
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
}
