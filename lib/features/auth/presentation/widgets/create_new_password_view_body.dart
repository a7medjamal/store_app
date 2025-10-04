import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/app_text_styles.dart';
import 'package:store_app/core/widgets/custom_elevated_button.dart';
import 'package:store_app/features/auth/presentation/cubit/update_password_cubit.dart';
import 'package:store_app/features/auth/presentation/widgets/custom_text_form_field.dart';

class CreateNewPasswordViewBody extends StatefulWidget {
  const CreateNewPasswordViewBody({super.key, required this.email});
  final String email;

  @override
  State<CreateNewPasswordViewBody> createState() =>
      _CreateNewPasswordViewBodyState();
}

class _CreateNewPasswordViewBodyState extends State<CreateNewPasswordViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordValid = false;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_validatePasswords);
    _confirmPasswordController.addListener(_validatePasswords);
  }

  @override
  void dispose() {
    _passwordController.removeListener(_validatePasswords);
    _confirmPasswordController.removeListener(_validatePasswords);
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _validatePasswords() {
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    final bool isValid =
        password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        password == confirmPassword &&
        password.length >= 8;

    if (_isPasswordValid != isValid) {
      setState(() => _isPasswordValid = isValid);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Text("Create New Password", style: AppTextStyles.heading1),
            const SizedBox(height: 48),
            CustomTextFormField(
              labelText: 'Password',
              controller: _passwordController,
              obscureText: true,
              validator: (value) {
                final password = value?.trim() ?? '';
                if (password.isEmpty) return 'Password is required';
                if (password.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
            ),
            Text(
              'Password minimum of 8 characters',
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
                if (confirmPassword != _passwordController.text.trim()) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            const SizedBox(height: 48),
            BlocConsumer<UpdatePasswordCubit, UpdatePasswordState>(
              listener: (context, state) {
                if (state is UpdatePasswordSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Password updated successfully!"),
                    ),
                  );
                  context.pushReplacement(AppRouter.kLoginWithEmailView);
                } else if (state is UpdatePasswordError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                return CustomElevatedButton(
                  text: state is UpdatePasswordLoading 
                      ? "Updating..." 
                      : "Update Password",
                  backgroundColor: _isPasswordValid
                      ? AppColors.primaryColor
                      : AppColors.inactiveButtonColor,
                  onPressed: state is UpdatePasswordLoading
                      ? null
                      : () {
                          if (!_isPasswordValid) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Please make sure your passwords match and are at least 8 characters long.",
                                ),
                              ),
                            );
                            return;
                          }
                          if (_formKey.currentState!.validate()) {
                            context.read<UpdatePasswordCubit>().updatePassword(
                                  email: widget.email,
                                  newPassword: _passwordController.text.trim(),
                                );
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
