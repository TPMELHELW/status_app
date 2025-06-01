import 'package:flutter/material.dart';
import 'package:status_app/core/constants/colors.dart';
import 'package:status_app/features/home/screens/widgets/mood_selection_widget.dart';
import 'package:status_app/features/home/screens/widgets/mood_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AppName'), centerTitle: true),
      body: Column(
        children: [
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
                Text(
                  'Select Your Mood Now',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                MoodSelectionWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
