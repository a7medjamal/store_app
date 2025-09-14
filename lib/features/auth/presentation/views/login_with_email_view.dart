import 'package:flutter/material.dart';
import 'package:store_app/features/auth/presentation/widgets/login_with_email_view_body.dart';

class LoginWithEmailView extends StatelessWidget {
  const LoginWithEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginWithEmailViewBody());
  }
}
