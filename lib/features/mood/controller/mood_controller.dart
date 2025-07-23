import 'package:animated_emoji/emoji_data.dart';
import 'package:animated_emoji/emojis.g.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:status_app/core/services/shared_prefrences_services.dart';
import 'package:status_app/features/mood/models/mood_model.dart';

class MoodController extends GetxController {
  static MoodController get instance => Get.find<MoodController>();

  late TextEditingController search;
  RxMap<String, List<MoodModel>> moodByDay = <String, List<MoodModel>>{}.obs;
  final UserService userService = Get.find<UserService>();

  @override
  void onInit() {
    search = TextEditingController();
    loadUserMoods();
    super.onInit();
  }

  void loadUserMoods() async {
    // final uid = FirebaseAuth.instance.currentUser!.uid;
    // final doc = await FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(uid)
    //     .get();

    // final moodList = (doc.data()?['mood'] as List<dynamic>? ?? [])
    //     .map((e) => MoodModel.fromMap(e))
    //     .toList();

    final grouped = <String, List<MoodModel>>{};
    for (var entry in userService.currentUser.value!.mood) {
      final key = DateFormat('yyyy-MM-dd').format(entry.timestamp);
      grouped.putIfAbsent(key, () => []).add(entry);
    }

    moodByDay.value = grouped;
  }

  Future<void> addMood(String mood) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final docRef = FirebaseFirestore.instance.collection('Users').doc(uid);

    // Step 1: Create new mood entry
    final newEntry = {
      'Mood': mood,
      'timestamp': DateTime.now().toUtc().toIso8601String(),
    };

    // Step 2: Add to Firestore
    await docRef.update({
      'Mood': FieldValue.arrayUnion([newEntry]),
    });

    // Step 3: Update local user model
    final currentUser = userService.currentUser.value;
    if (currentUser != null) {
      final updatedMoodList = [
        ...currentUser.mood,
        MoodModel.fromMap(newEntry),
      ];
      final updatedUser = currentUser.copyWith(mood: updatedMoodList);
      userService.currentUser.value = updatedUser;
      userService.saveUser(updatedUser);
    }

    // ✅ Step 4: Refresh moodByDay
    loadUserMoods();
  }

  Map<String, AnimatedEmojiData> emojiData = {
    'Smile': AnimatedEmojis.warmSmile,
    'Normal': AnimatedEmojis.slightlyHappy,
    'Neutral': AnimatedEmojis.neutralFace,
    'Sad ': AnimatedEmojis.sad,
    'Angry': AnimatedEmojis.angry,
    'Cry': AnimatedEmojis.cry,
  };
  // Future<void> addMood(String mood) async {
  //   final uid = FirebaseAuth.instance.currentUser!.uid;
  //   final docRef = FirebaseFirestore.instance.collection('Users').doc(uid);

  //   final newEntry = {
  //     'Mood': mood,
  //     'timestamp': DateTime.now().toUtc(), // Or .toLocal() if preferred
  //   };

  //   await docRef.update({
  //     'Mood': FieldValue.arrayUnion([newEntry]),
  //   });
  // }

  @override
  void onClose() {
    search.dispose();
    super.onClose();
  }
}
