import 'package:flutter/material.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/core/utils/app_text_styles.dart';
import 'package:store_app/core/widgets/custom_elevated_button.dart';
import 'package:store_app/features/auth/presentation/widgets/custom_checkbox.dart';
import 'package:store_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:store_app/features/auth/presentation/widgets/terms_and_conditions_row.dart';

class SignUpWithEmailViewBody extends StatefulWidget {
  const SignUpWithEmailViewBody({super.key});

  @override
  State<SignUpWithEmailViewBody> createState() =>
      _SignUpWithEmailViewBodyState();
}

class _SignUpWithEmailViewBodyState extends State<SignUpWithEmailViewBody> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isChecked = false;
  bool _isFormValid = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _validateForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    setState(() {
      _isFormValid = isValid;
    });
  }

  // void _submit() {
  //   if (_formKey.currentState!.validate()) {
  //     ScaffoldMessenger.of(
  //       context,
  //     ).showSnackBar(const SnackBar(content: Text("Form is valid!")));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        onChanged: _validateForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            Text('Signup with Email', style: AppTextStyles.textLargeBold),
            const SizedBox(height: 48),
            CustomTextFormField(
              labelText: 'Email',
              validator: (value) {
                final email = value?.trim() ?? '';
                if (email.isEmpty) {
                  return 'Email is required';
                }
                final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (!emailRegex.hasMatch(email)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              labelText: 'Password',
              controller: _passwordController,
              obscureText: true,
              validator: (value) {
                final password = value?.trim() ?? '';
                if (password.isEmpty) {
                  return 'Password is required';
                }
                if (password.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
            ),
            Text(
              'Password Minimum of 8 characters',
              style: AppTextStyles.textSmall.copyWith(color: AppColors.green),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              labelText: 'Confirm Password',
              controller: _confirmPasswordController,
              obscureText: true,
              validator: (value) {
                final confirmPassword = value?.trim() ?? '';
                if (confirmPassword.isEmpty) {
                  return 'Confirm your password';
                }
                if (confirmPassword != _passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                CustomCheckbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                ),
                const SizedBox(width: 8),
                TermsAndConditionsRow(),
              ],
            ),
            const SizedBox(height: 48),
            CustomElevatedButton(
              text: 'Signup',
              backgroundColor: (_isFormValid && _isChecked)
                  ? AppColors.primaryColor
                  : AppColors.inactiveButtonColor,
              onPressed: () {
                if (_isFormValid && _isChecked) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Form is valid!")),
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
