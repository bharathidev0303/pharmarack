
import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';

class PRPositionedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double minWidth;
  final double height;
  final Color? backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double? leftPosition;
  final double? topPosition;
  final double? rightPosition;
  final double? bottomPosition;
  final double? fontSize;

  const PRPositionedButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.minWidth,
    required this.height,
    this.backgroundColor,
    required this.textColor,
    this.borderRadius = 5.0,
    this.leftPosition,
    this.topPosition,
    this.rightPosition,
    this.bottomPosition,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: leftPosition,
      top: topPosition,
      right: rightPosition,
      bottom: bottomPosition,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          minimumSize: Size(minWidth, height),
          backgroundColor: backgroundColor,
        ),
        child: Text(text,
            style: context.textStyles.button3!
                .copyWith(color: textColor, fontSize: fontSize)),
      ),
    );
  }
}
