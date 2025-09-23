import 'package:store_app/features/auth/domain/entities/user_entity.dart';
import 'package:store_app/features/auth/domain/repositories/auth_repo.dart';

class SignUpUseCase {
  final AuthRepo repository;

  SignUpUseCase(this.repository);

  Future<UserEntity> call(String email, String password) {
    return repository.signUp(email: email, password: password);
  }
}
