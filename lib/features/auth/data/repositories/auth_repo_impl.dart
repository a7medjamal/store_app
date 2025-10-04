
import 'package:store_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:store_app/features/auth/domain/entities/user_entity.dart';
import 'package:store_app/features/auth/domain/repositories/auth_repo.dart';

class AuthRepositoryImpl implements AuthRepo {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UserEntity> signUp({required String email, required String password}) {
    return remoteDataSource.signUp(email, password);
  }

  @override
  Future<UserEntity> login({required String email, required String password}) {
    return remoteDataSource.login(email, password);
  }

  @override
  Future<void> sendOtp({required String email}) {
    return remoteDataSource.sendOtp(email);
  }

  @override
  Future<void> verifyOtp({required String email, required String otp}) {
    return remoteDataSource.verifyOtp(email, otp);
  }
  
  @override
  Future<void> updatePassword({required String email, required String newPassword}) {
    return remoteDataSource.updatePassword(email, newPassword);
  }

  @override
  Future<void> logout() async {
    await remoteDataSource.logout();
  }

  @override
  UserEntity? getCurrentUser() {
    return remoteDataSource.getCurrentUser();
  }
}
