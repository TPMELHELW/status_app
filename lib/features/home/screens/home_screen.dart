import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:status_app/core/constants/colors.dart';
import 'package:status_app/features/home/controller/home_controller.dart';
import 'package:status_app/features/home/screens/widgets/mood_selection_widget.dart';
import 'package:status_app/features/home/screens/widgets/mood_widget.dart';
import 'package:status_app/features/mood/controller/mood_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    final MoodController moodController = Get.put(MoodController());
    final userData = controller.userService.currentUser.value!;
    return Scaffold(
      appBar: AppBar(
        title: Text('AppName'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => controller.signOut(),
          icon: Icon(Iconsax.logout),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 20,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: AppColors.darkerGrey,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Welcome ${userData.name}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Your UserName is: ${userData.userName}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      IconButton(
                        onPressed: () {
                          Clipboard.setData(
                            ClipboardData(text: userData.userName),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Copied to clipboard')),
                          );
                        },
                        icon: Icon(Iconsax.copy),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: AppColors.darkGrey,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  Text(
                    "You & Your Friend Mood",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),

                  MoodWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
