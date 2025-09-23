import 'package:store_app/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<UserEntity> signUp({required String email, required String password});
  Future<UserEntity> login({required String email, required String password});
  Future<void> sendOtp({required String email}); 
  Future<void> verifyOtp({required String email, required String otp}); 
  Future<void> logout();
  UserEntity? getCurrentUser();
}
