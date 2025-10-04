import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:store_app/features/auth/domain/usecases/update_password_usecase.dart';

part 'update_password_state.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  final UpdatePasswordUseCase updatePasswordUseCase;

  UpdatePasswordCubit({required this.updatePasswordUseCase})
    : super(UpdatePasswordInitial());

  Future<void> updatePassword({
    required String email,
    required String newPassword,
  }) async {
    emit(UpdatePasswordLoading());
    try {
      await updatePasswordUseCase(email: email, newPassword: newPassword);
      emit(UpdatePasswordSuccess());
    } catch (e) {
      emit(UpdatePasswordError(message: e.toString()));
    }
  }
}
