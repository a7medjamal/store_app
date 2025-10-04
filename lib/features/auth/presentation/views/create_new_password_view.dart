import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/auth/domain/usecases/update_password_usecase.dart';
import 'package:store_app/features/auth/presentation/cubit/update_password_cubit.dart';
import 'package:store_app/features/auth/presentation/widgets/create_new_password_view_body.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdatePasswordCubit(
        updatePasswordUseCase: context.read<UpdatePasswordUseCase>(),
      ),
      child: Scaffold(body: CreateNewPasswordViewBody(email: email)),
    );
  }
}
