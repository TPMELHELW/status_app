import 'package:flutter/material.dart';
import 'package:status_app/core/constants/colors.dart';

class NormalButtonWidget extends StatelessWidget {
  final String text;
  const NormalButtonWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(50, 50),
        backgroundColor: AppColors.buttonSecondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {},
      child: Text(text),
    );
  }
}
