import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:status_app/core/common/normal_button_widget.dart';
import 'package:status_app/core/common/normal_text_field_widget.dart';
import 'package:status_app/core/validators/validation.dart';
import 'package:status_app/features/auth/controller/forget_password_controller.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgetPasswordController controller = Get.put(
      ForgetPasswordController(),
    );
    return Scaffold(
      appBar: AppBar(title: Text('Forget Password'), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Lottie.asset('assets/animation/forget.json'),
            Form(
              key: controller.formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 15,
                children: [
                  NormalTextFieldWidget(
                    validator: (value) =>
                        AppFieldValidator.validateEmail(value),
                    text: 'Enter Your Email',
                    icon: Iconsax.user,
                    controller: controller.email,
                  ),
                  NormalButtonWidget(
                    statusRequest: controller.statusRequest,
                    text: 'Send',
                    onPress: () => controller.sendResetPassword(),
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
