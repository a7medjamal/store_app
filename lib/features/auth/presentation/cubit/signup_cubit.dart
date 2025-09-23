import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/auth/domain/entities/user_entity.dart';
import 'package:store_app/features/auth/domain/usecases/signup_usecase.dart';

class SignUpState {
  final bool loading;
  final UserEntity? user;
  final String? error;

  const SignUpState({
    this.loading = false,
    this.user,
    this.error,
  });

  SignUpState copyWith({
    bool? loading,
    UserEntity? user,
    String? error,
  }) {
    return SignUpState(
      loading: loading ?? this.loading,
      user: user ?? this.user,
      error: error,
    );
  }
}

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase signUpUseCase;

  SignUpCubit(this.signUpUseCase) : super(const SignUpState());

  Future<void> signUp(String email, String password) async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final user = await signUpUseCase(email, password);
      emit(SignUpState(user: user));
    } catch (e) {
      emit(SignUpState(error: e.toString()));
    }
  }
}
