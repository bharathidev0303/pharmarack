import 'package:flutter/material.dart';

import '../../dls/color/app_colors.dart';
import '../../dls/text_utils/app_text_style.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final Function() onClick;

  const SecondaryButton({super.key, required this.text, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.secondaryButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5), // <-- Radius
          ),
        ),
        onPressed: () {
          onClick();
        },
        child: Text(
          text,
          style: AppTextStyles.buttonTextStyle12W500(
              color: AppColors.secondaryButtonTextColor),
        ),
      ),
    );
  }
}
