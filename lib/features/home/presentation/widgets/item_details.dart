import 'package:flutter/material.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/core/utils/app_text_styles.dart';
import 'package:store_app/features/home/presentation/widgets/item_rating_row.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 294,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: AppColors.textGrey.withValues(alpha: 0.3), // ✅ modern opacity
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: SizedBox(
              width: double.infinity,
              height: 160,
              child: Image.asset('assets/images/item.png', fit: BoxFit.fill),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Product Name',
              style: AppTextStyles.textSmallSemiBold.copyWith(
                color: Colors.black,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text(
                  '\$120',
                  style: AppTextStyles.textSmallBold.copyWith(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 8),
                Transform.translate(
                  offset: const Offset(0, 3),
                  child: Text(
                    '\$150',
                    style: AppTextStyles.textSmallSemiBold.copyWith(
                      color: AppColors.textGrey,
                      decoration: TextDecoration.lineThrough,
                    ),
                    textScaler: const TextScaler.linear(0.96),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: ItemRatingRow(),
          ),
        ],
      ),
    );
  }
}
