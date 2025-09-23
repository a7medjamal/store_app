import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(12),
      shadowColor: Colors.black26,
      child: SearchBar(
        backgroundColor: WidgetStatePropertyAll(const Color(0xffFBFBFC)),
        elevation: WidgetStatePropertyAll(0),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        hintText: 'Find your favorite items',
        leading: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SvgPicture.asset('assets/svgs/search_icon.svg'),
        ),
        trailing: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset('assets/svgs/search_visual.svg'),
          ),
        ],
      ),
    );
  }
}
