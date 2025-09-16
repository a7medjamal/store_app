import 'package:flutter/material.dart';
import 'package:store_app/features/auth/presentation/widgets/custom_auth_elevated_button.dart';

class ExternalRegisterButtons extends StatelessWidget {
  const ExternalRegisterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAuthElevatedButton(
          text: 'Signup with Google',
          onPressed: () {},
          svgPath: 'assets/svgs/google_logo.svg',
        ),
        const SizedBox(height: 16),
        CustomAuthElevatedButton(
          text: 'Signup with Apple',
          onPressed: () {},
          svgPath: 'assets/svgs/apple_logo.svg',
        ),
      ],
    );
  }
}
