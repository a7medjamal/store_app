import 'package:flutter/material.dart';
import 'package:store_app/features/auth/presentation/widgets/create_new_password_view_body.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CreateNewPasswordViewBody());
  }
}
