import 'package:flutter/material.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/core/utils/app_text_styles.dart';
import 'package:store_app/core/widgets/custom_elevated_button.dart';
import 'package:store_app/features/auth/presentation/widgets/otp_field.dart';
import 'package:store_app/features/auth/presentation/widgets/sign_up_redirect_row.dart';

class OtpViewBody extends StatefulWidget {
  const OtpViewBody({super.key});

  @override
  State<OtpViewBody> createState() => _OtpViewBodyState();
}

class _OtpViewBodyState extends State<OtpViewBody> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNodes.first);
    });
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  String getOtp() => _controllers.map((c) => c.text).join();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Text("Enter 4 Digit Code", style: AppTextStyles.heading1),
          const SizedBox(height: 8),
          Text(
            "Enter 4 digit code that your receive on your email (pixelshipon@gmail.com)",
            style: AppTextStyles.textSmallSemiBold,
          ),
          const SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (i) {
              return OtpField(
                controller: _controllers[i],
                focusNode: _focusNodes[i],
                nextNode: i < 3 ? _focusNodes[i + 1] : null,
                prevNode: i > 0 ? _focusNodes[i - 1] : null,
              );
            }),
          ),
          const SizedBox(height: 48),
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
          const SizedBox(height: 48),
          Center(
            child: CustomElevatedButton(text: "Continue", onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
