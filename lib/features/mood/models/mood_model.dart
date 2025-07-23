import 'package:cloud_firestore/cloud_firestore.dart';

class MoodModel {
  final String mood;
  final DateTime timestamp;

  MoodModel({required this.mood, required this.timestamp});

  factory MoodModel.fromMap(Map<String, dynamic> map) {
    final ts = map['timestamp'];

    return MoodModel(
      mood: map['Mood'],
      timestamp: ts is Timestamp
          ? ts.toDate()
          : ts is String
          ? DateTime.parse(ts)
          : ts as DateTime,
    );
  }

  Map<String, dynamic> toMap() => {
    'Mood': mood,
    'timestamp': timestamp
        .toIso8601String(), // save as string for local storage
  };
}
