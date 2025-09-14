import 'package:flutter/material.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/core/utils/app_text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(355, 55),
        backgroundColor: backgroundColor ?? AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(text, style: AppTextStyles.textMediumBold),
    );
  }
}
