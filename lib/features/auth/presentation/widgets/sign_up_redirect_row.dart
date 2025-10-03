import 'package:flutter/material.dart';

class TextWithLinkRow extends StatelessWidget {
  final String prefixText; // e.g. "Don't have any account yet? "
  final String linkText; // e.g. "Signup"
  final VoidCallback onTap;
  final TextStyle? prefixStyle;
  final TextStyle? linkStyle;
  final Color? underlineColor;

  const TextWithLinkRow({
    super.key,
    required this.prefixText,
    required this.linkText,
    required this.onTap,
    this.prefixStyle,
    this.linkStyle,
    this.underlineColor,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: prefixText,
            style:
                prefixStyle ??
                const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: InkWell(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: underlineColor ?? Colors.blue,
                      width: 1.5,
                    ),
                  ),
                ),
                child: Text(
                  linkText,
                  style:
                      linkStyle ??
                      const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        decoration: TextDecoration.none,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
