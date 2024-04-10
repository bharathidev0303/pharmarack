import 'package:flutter/material.dart';

///[RoundedCornerButton] is generic rounded button
///[buttonColor]: use button color to change color of button
///[onPressed]: Callback when button is clicked
///[text]: Text which present on button
///[textStyle]: Text style to change text style font and color of text on button
///[buttonContentPadding]: Padding inside button text content
///[maxSize]: Max size of button
///[minSize]: Min size of button
class RoundedCornerButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Function() onPressed;
  final TextStyle? textStyle;
  final EdgeInsets? buttonContentPadding;
  final Size? maxSize;
  final Size? minSize;

  const RoundedCornerButton({
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
        padding: buttonContentPadding,
        shape: const StadiumBorder(),
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
