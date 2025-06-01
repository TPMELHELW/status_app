import 'package:animated_emoji/emoji.dart';
import 'package:animated_emoji/emojis.g.dart';
import 'package:flutter/material.dart';

class MoodSelectionWidget extends StatelessWidget {
  const MoodSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 2,
      children:
          [
            AnimatedEmojis.warmSmile,
            AnimatedEmojis.slightlyHappy,
            AnimatedEmojis.neutralFace,
            AnimatedEmojis.sad,
            AnimatedEmojis.angry,
            AnimatedEmojis.cry,
          ].map((emoji) {
            return IconButton(
              icon: AnimatedEmoji(emoji, size: 40),
              onPressed: () {
                // Set mood
              },
            );
          }).toList(),
    );
  }
}
