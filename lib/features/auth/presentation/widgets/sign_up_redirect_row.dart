import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/app_text_styles.dart';

class SignUpRedirectRow extends StatelessWidget {
  const SignUpRedirectRow({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Don't have any account yet? ",
            style: AppTextStyles.textSmall.copyWith(
              color: AppColors.textGrey,
              fontWeight: FontWeight.w400,
            ),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: InkWell(
              onTap: () {
                GoRouter.of(context).push(AppRouter.kSignUpView);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.primaryColor,
                      width: 1.5,
                    ),
                  ),
                ),
                child: Text(
                  "Signup",
                  style: AppTextStyles.textSmallBold.copyWith(
                    color: AppColors.primaryColor,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
