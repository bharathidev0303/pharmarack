
import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';

class PrimaryRoundedCornerButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final double? cornerRadius;
  final Color? color;
  final TextStyle? buttonTextStyle;

  const PrimaryRoundedCornerButton(
      {super.key,
      required this.text,
      required this.onTap,
      this.cornerRadius,
      this.color,
      this.buttonTextStyle});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onTap.call(),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: color ?? AppColors.secondaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(cornerRadius ?? 10), // <-- Radius
            ),
          ),
          onPressed: () {
            onTap();
          },
          child: Text(
            text,
            style: buttonTextStyle ?? AppTextStyles.buttonTextStyle12W500(),
          ),
        ),
      ),
    );
  }
}
