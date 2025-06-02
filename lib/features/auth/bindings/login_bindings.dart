import 'package:get/get.dart';
import 'package:status_app/data/auth_repository.dart';
import 'package:status_app/data/user_repository.dart';
import 'package:status_app/features/auth/controller/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthRepository());
    Get.put(UserRepository());
    Get.put(LoginController());
  }
}
