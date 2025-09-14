import 'package:flutter/material.dart';
import 'package:store_app/features/auth/presentation/widgets/custom_login_elevated_button.dart';

class ExternalLoginButtons extends StatelessWidget {
  const ExternalLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomLoginElevatedButton(
          text: 'Login with Google',
          onPressed: () {},
          svgPath: 'assets/svgs/google_logo.svg',
        ),
        const SizedBox(height: 16),
        CustomLoginElevatedButton(
          text: 'Login with Apple',
          onPressed: () {},
          svgPath: 'assets/svgs/apple_logo.svg',
        ),
      ],
    );
  }
}
