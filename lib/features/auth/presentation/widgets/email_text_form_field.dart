import 'package:flutter/material.dart';
import 'package:store_app/features/auth/presentation/widgets/custom_text_form_field.dart';

class EmailTextFormField extends StatelessWidget {
  final Function(String) onChanged;
  final String? Function(String?) validator;
  final bool isValid;

  const EmailTextFormField({
    super.key,
    required this.onChanged,
    required this.validator,
    required this.isValid,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: 'Email',
      validator: validator,
      onChanged: onChanged,
      isValid: isValid,
    );
  }
}
