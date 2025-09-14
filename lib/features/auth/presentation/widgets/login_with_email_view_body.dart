import 'package:flutter/material.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/core/utils/app_text_styles.dart';
import 'package:store_app/core/widgets/custom_elevated_button.dart';
import 'package:store_app/features/auth/presentation/widgets/email_text_form_field.dart';
import 'package:store_app/features/auth/presentation/widgets/forget_password_row.dart';
import 'package:store_app/features/auth/presentation/widgets/password_text_form_field.dart';

class LoginWithEmailViewBody extends StatefulWidget {
  const LoginWithEmailViewBody({super.key});

  @override
  State<LoginWithEmailViewBody> createState() => _LoginWithEmailViewBodyState();
}

class _LoginWithEmailViewBodyState extends State<LoginWithEmailViewBody> {
  final _formKey = GlobalKey<FormState>();
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool get _isFormValid => _isEmailValid && _isPasswordValid;
  final _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            Text('Login with Email', style: AppTextStyles.textLargeBold),
            const SizedBox(height: 48),
            EmailTextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!_emailRegex.hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  _isEmailValid =
                      value.isNotEmpty && _emailRegex.hasMatch(value);
                });
              },
            ),
            const SizedBox(height: 16),
            PasswordTextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  _isPasswordValid = value.isNotEmpty && value.length >= 8;
                });
              },
            ),
            const SizedBox(height: 8),
            ForgetPasswordRow(),
            const SizedBox(height: 48),
            CustomElevatedButton(
              text: 'Login',
              backgroundColor: _isFormValid
                  ? AppColors.primaryColor
                  : AppColors.inactiveButtonColor,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing login...')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
