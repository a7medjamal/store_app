import 'package:flutter/material.dart';

class OtpField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextNode;
  final FocusNode? prevNode;

  const OtpField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.nextNode,
    this.prevNode,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Center(
        child: TextField(
          controller: controller,
          focusNode: focusNode,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          showCursor: false,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            counterText: "",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
          onChanged: (value) {
            if (value.isNotEmpty && nextNode != null) {
              FocusScope.of(context).requestFocus(nextNode);
            } else if (value.isEmpty && prevNode != null) {
              FocusScope.of(context).requestFocus(prevNode);
            }
          },
        ),
      ),
    );
  }
}
