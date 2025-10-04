import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/services/auth_service.dart';
import 'package:store_app/features/auth/domain/repositories/auth_repo.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final AuthRepo authRepo;
  final AuthService authService;

  LogoutCubit({required this.authRepo, required this.authService}) 
      : super(LogoutInitial());

  Future<void> logout() async {
    emit(LogoutLoading());
    try {
      await authRepo.logout();
      await authService.clearUserLoginState();
      emit(LogoutSuccess());
    } catch (e) {
      emit(LogoutError(message: e.toString()));
    }
  }
}

abstract class LogoutState {}

class LogoutInitial extends LogoutState {}

class LogoutLoading extends LogoutState {}

class LogoutSuccess extends LogoutState {}

class LogoutError extends LogoutState {
  final String message;
  
  LogoutError({required this.message});
}