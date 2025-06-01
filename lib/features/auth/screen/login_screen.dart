import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:status_app/core/common/normal_button_widget.dart';
import 'package:status_app/core/common/normal_text_field_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

                spacing: 10,
                children: [
                  NormalTextFieldWidget(text: 'Email', icon: Iconsax.user),
                  NormalTextFieldWidget(
                    text: 'Password',
                    icon: Iconsax.password_check,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        minimumSize: Size(10, 10),
                      ),
                      onPressed: () {},
                      child: Text('Forget Password ?'),
                    ),
                  ),
                  NormalButtonWidget(text: 'Login'),
                ],
              ),
            ),
            Text.rich(
              TextSpan(children: [TextSpan(text: "Don't have Account?")]),
            ),
            // NormalButtonWidget(text: 'SignUp'),
          ],
        ),
      ),
    );
  }
}
