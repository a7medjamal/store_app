import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/app_text_styles.dart';
import 'package:store_app/core/widgets/custom_elevated_button.dart';
import 'package:store_app/features/auth/presentation/cubit/signup_cubit.dart';
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

            /// Email
            CustomTextFormField(
              labelText: 'Email',
              controller: _emailController,
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
                const TermsAndConditionsRow(),
              ],
            ),
            const SizedBox(height: 48),
            BlocConsumer<SignUpCubit, SignUpState>(
              listener: (context, state) {
                if (state.error != null) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.error!)));
                } else if (state.user != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Signup successful!')),
                  );
                  GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
                }
              },
              builder: (context, state) {
                return CustomElevatedButton(
                  text: state.loading ? 'Signing up...' : 'Signup',
                  backgroundColor: (_isFormValid && _isChecked)
                      ? AppColors.primaryColor
                      : AppColors.inactiveButtonColor,
                  onPressed: (!_isFormValid || !_isChecked || state.loading)
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            context.read<SignUpCubit>().signUp(
                              _emailController.text.trim(),
                              _passwordController.text.trim(),
                            );
                            GoRouter.of(
                              context,
                            ).pushReplacement(AppRouter.kLoginView);
                          }
                        },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
