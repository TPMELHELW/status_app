import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:status_app/core/functions/snack_bar.dart';
import 'package:status_app/features/auth/models/user_model.dart';

class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance.currentUser;

  Future<void> saveUserInf(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } catch (e) {
      showErrorSnackbar('Error', e.toString());
    }
  }

  Future<UserModel> getUserData() async {
    try {
      final data = await _db.collection('Users').doc(_auth!.uid).get();
      if (data.exists) {
        return UserModel.fromSnapshot(data);
      } else {
        return UserModel.empty();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateUserDetails(UserModel data) async {
    try {
      await _db.collection('Users').doc(_auth!.uid).update(data.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> updateSingleUserInf(Map<String, dynamic> data) async {
    try {
      await _db.collection('Users').doc(_auth!.uid).update(data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> removeUserData() async {
    try {
      await _db.collection('Users').doc(_auth!.uid).delete();
    } catch (e) {
      throw Exception(e);
    }
  }

  // Future<String> uploadProfileImage(String path, XFile file) async {
  //   try {
  //     final image = FirebaseStorage.instance.ref(path).child(file.name);
  //     await image.putFile(File(file.path));
  //     final url = await image.getDownloadURL();
  //     return url;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }
}
