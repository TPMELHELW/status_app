import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:status_app/core/common/normal_button_widget.dart';
import 'package:status_app/features/auth/controller/verify_controller.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final VerifyController controller = Get.put(VerifyController());
    return Scaffold(
      appBar: AppBar(title: Text('Verify Your Email'), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Lottie.asset('assets/animation/cat.json'),
            Text(
              'Verify your email address!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              'Congratulations! Your Account Awaits: Please Check Your Email',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 150),
            NormalButtonWidget(
              text: 'Resend',
              onPress: () => controller.sendEmailVerification(),
              statusRequest: controller.statusRequest,
            ),
          ],
        ),
      ),
    );
  }
}
