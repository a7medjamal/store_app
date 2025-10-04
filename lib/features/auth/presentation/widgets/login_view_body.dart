import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/app_text_styles.dart';
import 'package:store_app/core/widgets/custom_elevated_button.dart';
import 'package:store_app/features/auth/presentation/widgets/custom_divider_row.dart';
import 'package:store_app/features/auth/presentation/widgets/external_login_buttons.dart';
import 'package:store_app/features/auth/presentation/widgets/text_with_link_row.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Text('Login to ShopZen', style: AppTextStyles.heading1),
          const SizedBox(height: 48),
          ExternalLoginButtons(),
          const SizedBox(height: 48),
          CustomDividerRow(),
          const SizedBox(height: 48),
          CustomElevatedButton(
            text: 'Login with Email',
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kLoginWithEmailView);
            },
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWithLinkRow(
                  prefixText: "Don't have an account yet? ",
                  linkText: "Signup",
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kSignUpView);
                  },
                  prefixStyle: AppTextStyles.textSmall.copyWith(
                    color: AppColors.textGrey,
                    fontWeight: FontWeight.w400,
                  ),
                  linkStyle: AppTextStyles.textSmallBold.copyWith(
                    color: AppColors.primaryColor,
                    decoration: TextDecoration.none,
                  ),
                  underlineColor: AppColors.primaryColor,
                ),
              ],
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
