import 'package:flutter/material.dart';

class CommonDialogButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Function() onPressed;
  final TextStyle? textStyle;
  final EdgeInsets? buttonContentPadding;
  final Size? maxSize;
  final Size? minSize;

  const CommonDialogButton({
    super.key,
    required this.text,
    required this.buttonColor,
    required this.onPressed,
    this.textStyle,
    this.buttonContentPadding,
    this.maxSize,
    this.minSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.only(top: 13, bottom: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: buttonColor,
        maximumSize: maxSize,
        minimumSize: minSize,
      ),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
