import 'package:flutter/material.dart';
import 'package:store_app/core/utils/app_text_styles.dart';
import 'package:store_app/core/widgets/custom_elevated_button.dart';
import 'package:store_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:store_app/features/auth/presentation/widgets/forget_password_row.dart';

class LoginWithEmailViewBody extends StatelessWidget {
  const LoginWithEmailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          Text('Login with Email', style: AppTextStyles.textLargeBold),
          const SizedBox(height: 48),
          CustomTextFormField(labelText: 'Email'),
          const SizedBox(height: 16),
          CustomTextFormField(labelText: 'Password'),
          const SizedBox(height: 8),
          ForgetPasswordRow(),
          const SizedBox(height: 48),
          CustomElevatedButton(text: 'Login', onPressed: () {}),
        ],
      ),
    );
  }
}
