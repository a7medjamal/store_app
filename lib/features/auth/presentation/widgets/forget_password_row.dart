import 'package:flutter/material.dart';
import 'package:store_app/core/utils/app_text_styles.dart';

class ForgetPasswordRow extends StatelessWidget {
  const ForgetPasswordRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {},
          child: Text(
            'Forgot Password',
            style: AppTextStyles.textSmallSemiBold,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}
