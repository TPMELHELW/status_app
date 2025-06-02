import 'package:flutter/material.dart';
import 'package:status_app/core/constants/colors.dart';

class NormalTextFieldWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const NormalTextFieldWidget({
    super.key,
    required this.text,
    required this.icon,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        prefixIcon: Icon(icon),
        hintStyle: Theme.of(context).textTheme.bodySmall,
        filled: true,
        fillColor: AppColors.darkGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
