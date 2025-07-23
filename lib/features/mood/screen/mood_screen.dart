import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:status_app/core/common/normal_button_widget.dart';
import 'package:status_app/core/common/normal_text_field_widget.dart';
import 'package:status_app/core/constants/colors.dart';
import 'package:status_app/features/home/screens/widgets/mood_selection_widget.dart';
import 'package:status_app/features/home/screens/widgets/mood_widget.dart';
import 'package:status_app/features/mood/controller/mood_controller.dart';

class MoodScreen extends StatelessWidget {
  const MoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MoodController controller = Get.put(MoodController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
          onPressed: () {
            Get.bottomSheet(
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: AppColors.darkGrey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Select Your Mood Now',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    MoodSelectionWidget(),
                  ],
                ),
              ),
            );
          },
          icon: Icon(Iconsax.add),
        ),
      ),
      appBar: AppBar(title: Text('Mood'), centerTitle: true),
      body: SingleChildScrollView(
        // padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                child: Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    NormalTextFieldWidget(
                      text: 'Your Friend UserName...',
                      icon: Iconsax.user,
                      controller: controller.search,
                    ),

                    NormalButtonWidget(text: 'Search'),
                  ],
                ),
              ),
            ),

            MoodWidget(),
          ],
        ),
      ),
    );
  }
}
