import 'package:flutter/material.dart';
import 'package:store_app/features/home/presentation/widgets/category_item.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryItem(
            categoryName: 'Fashion',
            categoryIcon: 'assets/svgs/fashion_icon.svg',
          ),
          const SizedBox(width: 16),
          CategoryItem(
            categoryName: 'Fitness',
            categoryIcon: 'assets/svgs/fitness_icon.svg',
          ),
          const SizedBox(width: 16),
          CategoryItem(
            categoryName: 'Living',
            categoryIcon: 'assets/svgs/living_icon.svg',
          ),
          const SizedBox(width: 16),
          CategoryItem(
            categoryName: 'Games',
            categoryIcon: 'assets/svgs/gaming_icon.svg',
          ),
          const SizedBox(width: 16),
          CategoryItem(
            categoryName: 'Stationery',
            categoryIcon: 'assets/svgs/stationery_icon.svg',
          ),
          const SizedBox(width: 16),
          CategoryItem(
            categoryName: 'Stationery',
            categoryIcon: 'assets/svgs/stationery_icon.svg',
          ),
        ],
      ),
    );
  }
}
