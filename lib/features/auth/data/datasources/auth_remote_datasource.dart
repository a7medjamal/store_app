import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signUp(String email, String password);
  Future<UserModel> login(String email, String password);
  Future<void> sendOtp(String email);
  Future<void> verifyOtp(String email, String otp);
  Future<void> updatePassword(String email, String newPassword);
  Future<void> logout();
  UserModel? getCurrentUser();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemoteDataSourceImpl({required this.firebaseAuth});

  @override
  Future<UserModel> signUp(String email, String password) async {
    final result = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserModel.fromFirebaseUser(result.user!);
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final result = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserModel.fromFirebaseUser(result.user!);
  }

  @override
  Future<void> sendOtp(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> verifyOtp(String email, String otp) async {
    throw UnimplementedError('Custom OTP verification required');
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  @override
  UserModel? getCurrentUser() {
    final user = firebaseAuth.currentUser;
    if (user == null) return null;
    return UserModel.fromFirebaseUser(user);
  }

  @override
  Future<void> updatePassword(String email, String newPassword) async {
    // Use email to reset password instead of requiring current user
    await firebaseAuth.sendPasswordResetEmail(email: email);
    // Note: In a real app, we would need to handle the password reset flow
    // This is a simplified implementation for demonstration purposes
  }
}
