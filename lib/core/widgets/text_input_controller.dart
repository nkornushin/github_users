import 'package:flutter/material.dart';

class TextInputController extends StatelessWidget {
  const TextInputController({
    super.key,
    this.controller,
    this.inputTextStyle,
    this.hintText,
    this.inputHintStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.onSubmitted,
    this.onChanged,
  });

  final TextEditingController? controller;
  final TextStyle? inputTextStyle;
  final String? hintText;
  final TextStyle? inputHintStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: inputTextStyle,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: inputHintStyle,
        prefixIcon: prefixIcon,
        fillColor: Colors.white,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          //borderSide: BorderSide(width: 0, style: BorderStyle.none),
        ),
        filled: true,
        isDense: true,
        contentPadding: const EdgeInsets.only(
          top: 9,
          bottom: 9,
          left: 9,
          right: 9,
        ),
      ),
      onSubmitted: onSubmitted,
      onChanged: onChanged,
    );
  }
}
