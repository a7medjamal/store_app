import 'package:flutter/material.dart';
import 'package:store_app/core/utils/app_text_styles.dart';
import 'package:store_app/features/home/presentation/widgets/categories_row.dart';
import 'package:store_app/features/home/presentation/widgets/custom_Search_bar.dart';
import 'package:store_app/features/home/presentation/widgets/custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          CustomAppBar(),
          const SizedBox(height: 16),
          CustomSearchBar(),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                'Categories',
                style: TextStyle(
                  fontFamily: 'SFProDisplay',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              InkWell(
                child: Text(
                  'View All',
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff68656E),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          CategoriesRow(),
          const SizedBox(height: 24),
          Image.asset('assets/images/discount.png'),
          const SizedBox(height: 24),
          Text(
            'Hot Deals',
            style: AppTextStyles.textSmallBold.copyWith(color: Colors.black),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
