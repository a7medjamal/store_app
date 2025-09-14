import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/widgets/custom_elevated_button.dart';
import 'package:store_app/core/utils/app_text_styles.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100),
          Image.asset('assets/images/onboarding.png'),
          const SizedBox(height: 50),
          const Text('Welcome to ShopZen', style: AppTextStyles.heading1),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your one-stop destination for hassle-\nfree online shopping',
                style: AppTextStyles.textMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(height: 65),
          Center(
            child: CustomElevatedButton(
              text: 'Get Started',
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kLoginView);
              },
            ),
          ),
        ],
      ),
    );
  }
}
