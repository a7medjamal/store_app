import 'package:flutter/material.dart';
import 'package:store_app/features/auth/presentation/widgets/custom_text_form_field.dart';

class PasswordTextFormField extends StatelessWidget {
  final Function(String) onChanged;
  final String? Function(String?) validator;
  final TextEditingController controller;

  const PasswordTextFormField({
    super.key,
    required this.onChanged,
    required this.validator,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: 'Password',
      obscureText: true,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
