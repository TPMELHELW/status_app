import 'package:animated_emoji/emoji.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:status_app/core/constants/colors.dart';
import 'package:status_app/core/routes/app_routes.dart';
import 'package:status_app/features/mood/controller/mood_controller.dart';

class MoodWidget extends StatelessWidget {
  const MoodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MoodController controller = Get.put(MoodController());
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: controller.moodByDay.entries.map((entry) {
        return GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.mood),
          child: Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.darkerGrey,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [BoxShadow(color: AppColors.black, blurRadius: 2)],
            ),
            child: Column(
              children: [
                Text(entry.key),
                Text(
                  controller.userService.currentUser.value!.name,
                  textAlign: TextAlign.left,

                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: AppColors.secondary,
                  ),
                ),
                ListView.builder(
                  itemCount: entry.value.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final data = entry.value;
                    return Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          spacing: 10,
                          children: [
                            AnimatedEmoji(
                              controller.emojiData[data[index].mood]!,
                              size: 45,
                              // onLoaded: (Duration dd){},
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DateFormat(
                                    'HH:mm',
                                  ).format(data[index].timestamp),
                                  textAlign: TextAlign.left,

                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  textAlign: TextAlign.left,

                                  data[index].mood,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Text(
                        //   controller.userService.currentUser.value!.mood,
                        //   style: Theme.of(context).textTheme.bodySmall,
                        // ),
                        // Text("Friend", style: Theme.of(context).textTheme.headlineMedium),
                        // AnimatedEmoji(AnimatedEmojis.warmSmile, size: 45),

                        // Text("Neutral"),
                        VerticalDivider(),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
