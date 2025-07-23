import 'package:get/get.dart';
import 'package:status_app/features/auth/bindings/login_bindings.dart';
import 'package:status_app/features/auth/screen/forget_password_screen/forget_password_screen.dart';
import 'package:status_app/features/auth/screen/login_screen/login_screen.dart';
import 'package:status_app/features/auth/screen/signup_screen/signup_screen.dart';
import 'package:status_app/features/auth/screen/signup_screen/verify_screen.dart';
import 'package:status_app/features/home/screens/home_screen.dart';
import 'package:status_app/features/mood/screen/mood_screen.dart';
// import '../modules/login/login_screen.dart';
// import '../modules/login/login_binding.dart';
// import '../modules/home/home_screen.dart';
// import '../modules/home/home_binding.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      // binding: HomeBinding(),
    ),
    GetPage(name: AppRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: AppRoutes.verify, page: () => const VerifyScreen()),
    GetPage(name: AppRoutes.forget, page: () => const ForgetPasswordScreen()),
    GetPage(name: AppRoutes.mood, page: () => const MoodScreen()),
  ];
}
