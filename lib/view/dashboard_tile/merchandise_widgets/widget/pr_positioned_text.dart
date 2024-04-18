import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';

class PRPositionedText extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color textColor;
  final double? leftPosition;
  final double? topPosition;
  final double? rightPosition;
  final double? bottomPosition;
  final double? fontSize;
  const PRPositionedText(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.textColor,
      this.leftPosition,
      this.topPosition,
      this.rightPosition,
      this.bottomPosition,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: leftPosition,
        top: topPosition,
        child: InkWell(
          onTap: () => onPressed.call(),
          child: Text(
            text,
            style: context.textStyles.paragraph3Regular!
                .copyWith(color: textColor, fontSize: fontSize),
          ),
        ));
  }
}
