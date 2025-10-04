import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_app/features/auth/data/models/user_model.dart';
import 'package:store_app/features/auth/domain/entities/user_entity.dart';

class AuthService {
  static const String _isLoggedInKey = 'is_logged_in';
  static const String _userEmailKey = 'user_email';
  static const String _userUidKey = 'user_uid';
  final FirebaseAuth _firebaseAuth;
  final SharedPreferences _prefs;
  AuthService({
    required FirebaseAuth firebaseAuth,
    required SharedPreferences prefs,
  }) : _firebaseAuth = firebaseAuth,
       _prefs = prefs;
  Future<void> saveUserLoginState(UserEntity user) async {
    await _prefs.setBool(_isLoggedInKey, true);
    await _prefs.setString(_userEmailKey, user.email);
    await _prefs.setString(_userUidKey, user.uid);
  }

  bool isUserLoggedIn() {
    return _prefs.getBool(_isLoggedInKey) ?? false;
  }

  UserEntity? getStoredUser() {
    if (!isUserLoggedIn()) return null;
    final email = _prefs.getString(_userEmailKey);
    final uid = _prefs.getString(_userUidKey);
    if (email == null || uid == null) return null;
    return UserModel(email: email, uid: uid);
  }

  Future<void> clearUserLoginState() async {
    await _prefs.setBool(_isLoggedInKey, false);
    await _prefs.remove(_userEmailKey);
    await _prefs.remove(_userUidKey);
  }

  Future<UserEntity?> autoLogin() async {
    final currentUser = _firebaseAuth.currentUser;
    if (currentUser != null) {
      await saveUserLoginState(UserModel.fromFirebaseUser(currentUser));
      return UserModel.fromFirebaseUser(currentUser);
    }
    if (isUserLoggedIn()) {
      return getStoredUser();
    }
    return null;
  }
}
