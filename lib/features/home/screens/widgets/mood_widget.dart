import 'package:animated_emoji/emoji.dart';
import 'package:animated_emoji/emojis.g.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:status_app/core/common/normal_button_widget.dart';
import 'package:status_app/core/common/normal_text_field_widget.dart';
import 'package:status_app/core/constants/colors.dart';

class MoodWidget extends StatelessWidget {
  const MoodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: AppColors.black, blurRadius: 2)],
      ),
      child: Column(
        spacing: 10,
        children: [
          Form(
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                NormalTextFieldWidget(
                  text: 'Your Friend UserName...',
                  icon: Iconsax.user,
                ),

                NormalButtonWidget(text: 'Search'),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    "You",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  AnimatedEmoji(AnimatedEmojis.angry, size: 45),
                  Text("Happy"),
                ],
              ),
              VerticalDivider(),
              Column(
                children: [
                  Text(
                    "Friend",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  AnimatedEmoji(AnimatedEmojis.warmSmile, size: 45),

                  Text("Neutral"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
