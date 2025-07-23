import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:status_app/features/mood/models/mood_model.dart';

class UserModel {
  final String id;
  final String name;
  final String userName;
  final String email;
  final List<MoodModel> mood;

  UserModel({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    required this.mood,
  });

  Map<String, dynamic> toJson() => {
    'UserName': userName,
    'Name': name,
    'Email': email,
    'Mood': mood.map((e) => e.toMap()).toList(),
  };

  Map<String, dynamic> toJson2() => {
    'Id': id,
    'UserName': userName,
    'Name': name,
    'Email': email,
    'Mood': mood.map((e) => e.toMap()).toList(),
  };

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
    name: map['Name'],
    email: map['Email'],
    mood: (map['Mood'] as List<dynamic>? ?? [])
        .map((e) => MoodModel.fromMap(e))
        .toList(),
    id: map['Id'],
    userName: map['UserName'],
  );

  static UserModel empty() =>
      UserModel(id: '', userName: '', email: '', name: '', mood: []);

  factory UserModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      userName: data['UserName'] ?? '',
      email: data['Email'] ?? '',
      name: data['Name'] ?? '',
      mood: (data['Mood'] as List<dynamic>? ?? [])
          .map((e) => MoodModel.fromMap(e))
          .toList(),
    );
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? userName,
    List<MoodModel>? mood,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      id: id,
      userName: userName ?? this.userName,
      mood: mood ?? this.mood,
    );
  }
}
