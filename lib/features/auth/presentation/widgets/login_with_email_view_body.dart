import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/core/utils/app_text_styles.dart';
import 'package:store_app/core/widgets/custom_elevated_button.dart';
import 'package:store_app/features/auth/presentation/cubit/login_cubit.dart';
import 'package:store_app/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:store_app/features/auth/presentation/widgets/forget_password_row.dart';

class LoginWithEmailViewBody extends StatefulWidget {
  const LoginWithEmailViewBody({super.key});

  @override
  State<LoginWithEmailViewBody> createState() => _LoginWithEmailViewBodyState();
}

class _LoginWithEmailViewBodyState extends State<LoginWithEmailViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool get _isFormValid => _isEmailValid && _isPasswordValid;

  final _emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
            CustomTextFormField(
              labelText: 'Email',
              controller: _emailController,
              validator: (value) {
                final email = value?.trim() ?? '';
                if (email.isEmpty) {
                  return 'Please enter your email';
                }
                if (!_emailRegex.hasMatch(email)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              isValid: _isEmailValid,
              onChanged: (value) {
                setState(() {
                  _isEmailValid =
                      value.isNotEmpty && _emailRegex.hasMatch(value);
                });
              },
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              labelText: 'Password',
              controller: _passwordController,
              validator: (value) {
                final password = value?.trim() ?? '';
                if (password.isEmpty) {
                  return 'Please enter your password';
                }
                if (password.length < 8) {
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
            const ForgetPasswordRow(),
            const SizedBox(height: 48),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state.error != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error!)),
                  );
                } else if (state.user != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Login successful!')),
                  );
                }
              },
              builder: (context, state) {
                return CustomElevatedButton(
                  text: state.loading ? 'Logging in...' : 'Login',
                  backgroundColor: _isFormValid
                      ? AppColors.primaryColor
                      : AppColors.inactiveButtonColor,
                  onPressed: !_isFormValid || state.loading
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            context.read<LoginCubit>().login(
                                  _emailController.text.trim(),
                                  _passwordController.text.trim(),
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
