import 'package:store_app/features/auth/domain/repositories/auth_repo.dart';

class UpdatePasswordUseCase {
  final AuthRepo authRepo;

  UpdatePasswordUseCase({required this.authRepo});

  Future<void> call({required String email, required String newPassword}) async {
    return await authRepo.updatePassword(email: email, newPassword: newPassword);
  }
}