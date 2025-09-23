import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.categoryName, required this.categoryIcon});
  final String categoryName;
  final String categoryIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(categoryIcon),
        SizedBox(width: 10),
        Text(
          categoryName,
          style: TextStyle(
            fontFamily: 'SFProDisplay',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xff68656E),
          ),
        ),
      ],
    );
  }
}
