import 'package:flutter/material.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key, 
    required this.labelText,
    this.validator,
    this.onChanged,
    this.obscureText = false,
  });

  final String labelText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: AppTextStyles.textSmallSemiBold),
        const SizedBox(height: 6),
        TextFormField(
          obscureText: obscureText,
          validator: validator,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: 'Enter your $labelText',
            hintStyle: AppTextStyles.textSmall,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.textGrey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.black),
            ),
            hoverColor: Colors.black,
          ),
        ),
      ],
    );
  }
}
