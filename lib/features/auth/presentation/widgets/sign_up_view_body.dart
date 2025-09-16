import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/app_text_styles.dart';
import 'package:store_app/core/widgets/custom_elevated_button.dart';
import 'package:store_app/features/auth/presentation/widgets/custom_divider_row.dart';
import 'package:store_app/features/auth/presentation/widgets/external_register_buttons.dart';
import 'package:store_app/features/auth/presentation/widgets/login_redirect_row.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Text('Signup to ShopZen', style: AppTextStyles.heading1),
          const SizedBox(height: 48),
          ExternalRegisterButtons(),
          const SizedBox(height: 48),
          CustomDividerRow(),
          const SizedBox(height: 48),
          CustomElevatedButton(
            text: 'Signup with Email',
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kSignUpWithEmailView);
            },
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [LoginRedirectRow()],
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
