import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:status_app/core/common/normal_button_widget.dart';
import 'package:status_app/core/common/normal_text_field_widget.dart';
import 'package:status_app/core/constants/colors.dart';
import 'package:status_app/core/routes/app_routes.dart';
import 'package:status_app/features/auth/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(title: Text('Mood App'), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Lottie.asset('assets/animation/mood.json', repeat: false),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  NormalTextFieldWidget(
                    text: 'Email',
                    icon: Iconsax.user,
                    controller: controller.email,
                  ),
                  SizedBox(height: 10),
                  NormalTextFieldWidget(
                    text: 'Password',
                    icon: Iconsax.password_check,
                    controller: controller.password,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 6),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size(0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        onPressed: () {},
                        child: Text(
                          'Forget Password?',
                          // style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  NormalButtonWidget(
                    text: 'Login',
                    statusRequest: controller.statusRequest,
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: AppColors.lightContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have Account?",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: AppColors.black),
                  ),
                  TextButton(
                    onPressed: () => Get.offAllNamed(AppRoutes.signup),
                    child: Text('SignUp'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
