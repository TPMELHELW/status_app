import 'package:animated_emoji/emoji.dart';
import 'package:flutter/material.dart';
import 'package:status_app/core/constants/colors.dart';
import 'package:status_app/features/mood/controller/mood_controller.dart';

class MoodSelectionWidget extends StatelessWidget {
  const MoodSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MoodController moodController = MoodController.instance;
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: moodController.emojiData.entries.map((entry) {
        final key = entry.key;
        final value = entry.value;
        return Container(
          padding: EdgeInsets.all(10),
          width: 80,
          decoration: BoxDecoration(
            color: AppColors.darkerGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: AnimatedEmoji(value, size: 40),
                onPressed: () => moodController.addMood(key),
              ),
              Text(
                key,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.white),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
