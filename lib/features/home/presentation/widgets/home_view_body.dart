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
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
          const SliverToBoxAdapter(child: CustomAppBar()),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          const SliverToBoxAdapter(child: CustomSearchBar()),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: Row(
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
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          const SliverToBoxAdapter(child: CategoriesRow()),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(child: Image.asset('assets/images/discount.png')),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(
            child: Text(
              'Hot Deals',
              style: AppTextStyles.textSmallBold.copyWith(color: Colors.black),
              textAlign: TextAlign.left,
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 30),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => const ItemDetails(),
                childCount: 10,
              ),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 240,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 0.66,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
