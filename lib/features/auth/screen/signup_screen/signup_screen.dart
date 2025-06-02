import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:status_app/core/common/normal_button_widget.dart';
import 'package:status_app/core/common/normal_text_field_widget.dart';
import 'package:status_app/core/constants/colors.dart';
import 'package:status_app/core/routes/app_routes.dart';
import 'package:status_app/core/validators/validation.dart';
import 'package:status_app/features/auth/controller/signup_controller.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.put(SignupController());
    return Scaffold(
      appBar: AppBar(title: Text('Mood App'), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Lottie.asset('assets/animation/mood.json', repeat: false),
            Form(
              key: controller.formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  NormalTextFieldWidget(
                    validator: (value) =>
                        AppFieldValidator.validateEmpty(value, 'Full Name'),
                    text: 'Full Name',
                    icon: Iconsax.user,
                    controller: controller.fullName,
                  ),
                  SizedBox(height: 10),

                  NormalTextFieldWidget(
                    validator: (value) =>
                        AppFieldValidator.validateEmail(value),
                    text: 'Email',
                    icon: Iconsax.user,
                    controller: controller.email,
                  ),
                  SizedBox(height: 10),
                  NormalTextFieldWidget(
                    validator: (value) =>
                        AppFieldValidator.validatePassword(value),
                    text: 'Password',
                    icon: Iconsax.password_check,
                    controller: controller.password,
                  ),
                  SizedBox(height: 16),
                  NormalButtonWidget(
                    text: 'Signup',
                    onPress: () async =>
                        await controller.signUpWithEmailAndPassword(),
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
                    "Have Account?",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium!.copyWith(color: AppColors.black),
                  ),
                  TextButton(
                    onPressed: () => Get.offAllNamed(AppRoutes.login),
                    child: Text('Login'),
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
