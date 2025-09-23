import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/core/utils/app_text_styles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff68656E),
                fontFamily: 'SFProDisplay',
              ),
            ),
            Text(
              'Al Mansoura, Egypt',
              style: AppTextStyles.textSmallSemiBold.copyWith(fontSize: 14),
            ),
          ],
        ),
        Spacer(),
        InkWell(child: SvgPicture.asset('assets/svgs/notification_icon.svg')),
      ],
    );
  }
}
