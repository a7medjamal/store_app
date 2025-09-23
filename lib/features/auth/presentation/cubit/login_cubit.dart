import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/auth/domain/entities/user_entity.dart';
import 'package:store_app/features/auth/domain/usecases/login_usecase.dart';

class LoginState {
  final bool loading;
  final UserEntity? user;
  final String? error;

  const LoginState({this.loading = false, this.user, this.error});

  LoginState copyWith({
    bool? loading,
    UserEntity? user,
    String? error,
  }) {
    return LoginState(
      loading: loading ?? this.loading,
      user: user ?? this.user,
      error: error,
    );
  }
}

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(const LoginState());

  Future<void> login(String email, String password) async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final user = await loginUseCase(email, password);
      emit(LoginState(user: user));
    } catch (e) {
      emit(LoginState(error: e.toString()));
    }
  }
}
