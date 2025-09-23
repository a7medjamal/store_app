import 'package:flutter/material.dart';
import 'package:store_app/core/utils/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Location',
        style: AppTextStyles.textSmall,)
      ],
    );
  }
}
