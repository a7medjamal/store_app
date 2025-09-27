import 'package:flutter/material.dart';
import 'package:store_app/features/auth/presentation/widgets/otp_view_body.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OtpViewBody(),
    );
  }
}
