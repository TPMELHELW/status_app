import 'package:flutter/material.dart';
import 'package:status_app/core/constants/colors.dart';

class NormalTextFieldWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  const NormalTextFieldWidget({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
