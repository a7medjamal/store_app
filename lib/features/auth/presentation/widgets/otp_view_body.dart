import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/core/utils/app_router.dart';
import 'package:store_app/core/utils/app_text_styles.dart';
import 'package:store_app/core/widgets/custom_elevated_button.dart';
import 'package:store_app/features/auth/presentation/widgets/otp_field.dart';
import 'package:store_app/features/auth/presentation/widgets/text_with_link_row.dart';

class OtpViewBody extends StatefulWidget {
  const OtpViewBody({super.key, required this.email});
  final String email;

  @override
  State<OtpViewBody> createState() => _OtpViewBodyState();
}

class _OtpViewBodyState extends State<OtpViewBody> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodes.first.requestFocus();
    });
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  String getOtp() => _controllers.map((c) => c.text).join();

  @override
  Widget build(BuildContext context) {
    final otpFilled = getOtp().length == 4;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Text(
            "Enter 4 Digit Code",
            style: AppTextStyles.heading1.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            "Enter the 4-digit code that you received on your email (${widget.email})",
            style: AppTextStyles.textSmallSemiBold.copyWith(
              color: AppColors.textGrey,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (i) {
              return OtpField(
                controller: _controllers[i],
                focusNode: _focusNodes[i],
                onChanged: (_) => setState(() {}),
                nextNode: i < 3 ? _focusNodes[i + 1] : null,
                prevNode: i > 0 ? _focusNodes[i - 1] : null,
              );
            }),
          ),
          const SizedBox(height: 40),
          Center(
            child: TextWithLinkRow(
              prefixText: "Email not received? ",
              linkText: "Resend Code",
              onTap: () {},
              prefixStyle: AppTextStyles.textSmall.copyWith(
                color: AppColors.textGrey,
                fontWeight: FontWeight.w400,
              ),
              linkStyle: AppTextStyles.textSmallBold.copyWith(
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
              underlineColor: Colors.black,
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: CustomElevatedButton(
              text: "Continue",
              backgroundColor: otpFilled
                  ? AppColors.primaryColor
                  : AppColors.inactiveButtonColor,
              onPressed: () {
                context.push(
                  AppRouter.kCreateNewPasswordView,
                  extra: widget.email,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
