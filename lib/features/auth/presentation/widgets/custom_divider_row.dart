import 'package:flutter/material.dart';
import 'package:store_app/core/utils/app_text_styles.dart';

class CustomDividerRow extends StatelessWidget {
  const CustomDividerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(color: Color(0xffCECDD4), thickness: 1, endIndent: 20),
        ),
        Text("Or", style: AppTextStyles.textSmall),
        Expanded(
          child: Divider(color: Color(0xffCECDD4), thickness: 1, indent: 20),
        ),
      ],
    );
  }
}
