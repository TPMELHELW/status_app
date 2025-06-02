import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_app/core/constants/colors.dart';
import 'package:status_app/core/constants/enums.dart';

class NormalButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onPress;
  final Rx<StatusRequest> statusRequest;

  NormalButtonWidget({
    super.key,
    required this.text,
    this.onPress,
    Rx<StatusRequest>? statusRequest,
  }) : statusRequest = statusRequest ?? StatusRequest.none.obs;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(50, 50),
        backgroundColor: AppColors.buttonSecondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPress,
      child: Obx(
        () => statusRequest.value == StatusRequest.loading
            ? const Center(child: CircularProgressIndicator())
            : Text(text),
      ),
    );
  }
}
