import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/app_text_styles.dart';

class CustomLoginElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final String svgPath;
  const CustomLoginElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.svgPath,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(355, 50),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Color(0xffDAE2FF)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(svgPath, width: 22, height: 22),
          SizedBox(width: 10),
          Text(text, style: AppTextStyles.textSmallBold),
        ],
      ),
    );
  }
}
