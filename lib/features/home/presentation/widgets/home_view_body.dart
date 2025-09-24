import 'package:flutter/material.dart';
import 'package:store_app/core/utils/app_text_styles.dart';
import 'package:store_app/features/home/presentation/widgets/categories_row.dart';
import 'package:store_app/features/home/presentation/widgets/custom_Search_bar.dart';
import 'package:store_app/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:store_app/features/home/presentation/widgets/item_details.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const CustomAppBar(),
            const SizedBox(height: 16),
            const CustomSearchBar(),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(
                    fontFamily: 'SFProDisplay',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                InkWell(
                  child: const Text(
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
            const CategoriesRow(),
            const SizedBox(height: 24),
            Image.asset('assets/images/discount.png'),
            const SizedBox(height: 24),
            Text(
              'Hot Deals',
              style: AppTextStyles.textSmallBold.copyWith(color: Colors.black),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 16),
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 220,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 0.66,
              ),
              itemBuilder: (context, index) {
                return const ItemDetails();
              },
            ),
          ],
        ),
      ),
    );
  }
}
