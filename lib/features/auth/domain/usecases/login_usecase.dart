import 'package:store_app/features/auth/domain/repositories/auth_repo.dart';

import '../entities/user_entity.dart';

class LoginUseCase {
  final AuthRepo repository;

  LoginUseCase(this.repository);

  Future<UserEntity> call(String email, String password) {
    return repository.login(email: email, password: password);
  }
}
