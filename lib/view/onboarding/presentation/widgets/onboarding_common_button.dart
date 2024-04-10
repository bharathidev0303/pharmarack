
import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';

class OnboardingCommonButton extends StatelessWidget {
  final Color buttonBackgroundColor;
  final void Function()? onPressedCallback;
  final String buttonText;

  const OnboardingCommonButton(
      {super.key,
      required this.buttonBackgroundColor,
      required this.onPressedCallback,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
            (states) => buttonBackgroundColor),
      ),
      onPressed: onPressedCallback,
      child: SizedBox(
        child: Center(
            child: Text(
          buttonText,
          style: AppTextStyles.style12W500Black(color: AppColors.white),
        )),
      ),
    );
  }
}
