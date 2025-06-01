import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  // String lastName;
  String userName;
  String email;
  // String states;
  // String number?;
  // String profilePicture;

  UserModel({
    required this.id,
    required this.name,
    // required this.lastName,
    required this.userName,
    required this.email,
    // required th/is.profilePicture,
  });

  Map<String, dynamic> toJson() {
    return {
      // 'FirstName': firstName,
      // 'LastName': lastName,
      'UserName': userName,
      'Email': email,
      // 'PhoneNumber': number,
      // 'ProfilePicture': profilePicture,
    };
  }

  static UserModel empty() => UserModel(
    id: '',
    // firstName: '',
    // lastName: '',
    userName: '',
    email: '',
    name: '',
    // number: '',
    // profilePicture: '',
  );

  factory UserModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      // firstNa/e: data['LastName'] ?? '',
      userName: data['UserName'] ?? '',
      email: data['Email'] ?? '',
      name: data['Name'] ?? '',
      // number: data['PhoneNumber'] ?? '',
      // profilePicture: data['ProfilePicture'] ?? '',
    );
  }
}
