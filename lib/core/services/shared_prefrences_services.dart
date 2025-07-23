import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:status_app/features/auth/models/user_model.dart';

class UserService extends GetxService {
  late SharedPreferences _prefs;
  final Rxn<UserModel> currentUser = Rxn<UserModel>();

  Future<UserService> init() async {
    _prefs = await SharedPreferences.getInstance();
    await _loadUserFromCache();
    return this;
  }

  Future<void> saveUser(UserModel user) async {
    final json = jsonEncode(user.toJson2());
    await _prefs.setString('user_data', json);
    currentUser.value = user;
  }

  Future<void> _loadUserFromCache() async {
    final json = _prefs.getString('user_data');
    if (json != null) {
      final map = jsonDecode(json);
      currentUser.value = UserModel.fromMap(map);
    }
  }

  Future<void> updateUserField({
    required String field,
    required dynamic value,
  }) async {
    final current = currentUser.value;
    if (current == null) return;

    await FirebaseFirestore.instance.collection('users').doc(current.id).update(
      {field: value},
    );

    final updatedUser = current.copyWith(
      name: field == 'Name' ? value : null,
      email: field == 'Email' ? value : null,
      userName: field == 'UserName' ? value : null,
    );

    await saveUser(updatedUser);
  }

  Future<void> clearUser() async {
    await _prefs.remove('user_data');
    currentUser.value = null;
  }
}
