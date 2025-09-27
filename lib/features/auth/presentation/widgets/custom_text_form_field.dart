import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/core/utils/app_colors.dart';
import 'package:store_app/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final bool? isValid;
  final Color? borderColor;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.isValid,
    this.controller,
    this.borderColor,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.labelText, style: AppTextStyles.textSmallSemiBold),
        const SizedBox(height: 6),
        TextFormField(
          controller: widget.controller,
          obscureText: _obscureText,
          onFieldSubmitted: widget.onChanged,
          validator: widget.validator,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            hintText: 'Enter your ${widget.labelText}',
            hintStyle: AppTextStyles.textSmall,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: widget.borderColor ?? AppColors.textGrey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: widget.borderColor ?? Colors.black),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: widget.borderColor ?? AppColors.textGrey,
              ),
            ),
            suffixIcon: widget.obscureText
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: _obscureText
                        ? SvgPicture.asset(
                            'assets/svgs/eye_icon.svg',
                            width: 18,
                            height: 18,
                          )
                        : SvgPicture.asset(
                            'assets/svgs/closed_eye_icon.svg',
                            width: 18,
                            height: 18,
                          ),
                  )
                : (widget.isValid == null
                      ? null
                      : Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SvgPicture.asset(
                            widget.isValid!
                                ? 'assets/svgs/valid_icon.svg'
                                : 'assets/svgs/unvalid_icon.svg',
                            width: 22,
                            height: 22,
                          ),
                        )),
            errorStyle: AppTextStyles.textSmallSemiBold.copyWith(
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
