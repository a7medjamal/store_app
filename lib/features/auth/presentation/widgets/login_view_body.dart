import 'package:flutter/material.dart';
import 'package:store_app/core/utils/app_text_styles.dart';
import 'package:store_app/core/widgets/custom_elevated_button.dart';
import 'package:store_app/features/auth/presentation/widgets/custom_divider_row.dart';
import 'package:store_app/features/auth/presentation/widgets/external_login_buttons.dart';
import 'package:store_app/features/auth/presentation/widgets/signup_redirect_row.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Text('Login to ShopZen', style: AppTextStyles.heading1),
          const SizedBox(height: 48),
          ExternalLoginButtons(),
          const SizedBox(height: 48),
          CustomDividerRow(),
          const SizedBox(height: 48),
          CustomElevatedButton(text: 'Login with Email', onPressed: () {}),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [SignupRedirectRow()],
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
