import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store_app/core/utils/app_text_styles.dart';

class ItemRatingRow extends StatelessWidget {
  const ItemRatingRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/svgs/star_icon.svg',
          width: 24,
          height: 24,
        ),
        const SizedBox(width: 8),
        Text(
          '4.5',
          style: AppTextStyles.textSmall.copyWith(
            color: Colors.black,
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(width: 8),
        Text(
          '(120)',
          style: AppTextStyles.textSmall.copyWith(
            color: Colors.black,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
