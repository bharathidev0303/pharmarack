
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';

class OnboardingInputText extends StatelessWidget {
  final String hintText;
  final String? errorText;
  final Icon prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController textController;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;

  const OnboardingInputText({
    super.key,
    required this.hintText,
    this.errorText,
    required this.textController,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.obscureText,
    this.inputFormatters,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      cursorColor: AppColors.white300,
      obscureText: obscureText,
      style: const TextStyle(
        fontSize: 14.0,
        color: AppColors.white300,
      ),
      controller: textController,
      inputFormatters: inputFormatters,
      keyboardType: textInputType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.white300),
            borderRadius: BorderRadius.zero),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.white100),
            borderRadius: BorderRadius.zero),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.white100),
            borderRadius: BorderRadius.zero),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.white300,
          fontSize: 14.0,
        ),
        errorText: errorText,
        errorMaxLines: 2,
      ),
    );
  }
}
