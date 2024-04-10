import 'package:flutter/material.dart';

class AppThemeTextStyles extends ThemeExtension<AppThemeTextStyles> {
  final TextStyle? header1Medium;
  final TextStyle? header2Medium;
  final TextStyle? header3Bold;
  final TextStyle? header4Medium;
  final TextStyle? header5Regular;
  final TextStyle? header6Regular;
  final TextStyle? header6Bold;
  final TextStyle? header7Medium;
  final TextStyle? header8Medium;
  final TextStyle? header9Medium;
  final TextStyle? header9Regular;
  final TextStyle? header10Medium;
  final TextStyle? header10Regular;
  final TextStyle? header11Medium;
  final TextStyle? header12Medium;
  final TextStyle? paragraph1Regular;
  final TextStyle? paragraph2Medium;
  final TextStyle? paragraph2Regular;
  final TextStyle? paragraph3Medium;
  final TextStyle? paragraph3Regular;
  final TextStyle? paragraph4Regular;
  final TextStyle? button1;
  final TextStyle? button2;
  final TextStyle? button3;

  AppThemeTextStyles({
    required this.header1Medium,
    required this.header2Medium,
    required this.header3Bold,
    required this.header4Medium,
    required this.header5Regular,
    required this.header6Regular,
    required this.header6Bold,
    required this.header7Medium,
    required this.header8Medium,
    required this.header9Medium,
    required this.header9Regular,
    required this.header10Medium,
    required this.header10Regular,
    required this.header11Medium,
    required this.header12Medium,
    required this.paragraph1Regular,
    required this.paragraph2Medium,
    required this.paragraph2Regular,
    required this.paragraph3Medium,
    required this.paragraph3Regular,
    required this.paragraph4Regular,
    required this.button1,
    required this.button2,
    required this.button3,
  });

  @override
  ThemeExtension<AppThemeTextStyles> copyWith({
    TextStyle? header1Medium,
    TextStyle? header2Medium,
    TextStyle? header3Bold,
    TextStyle? header4Medium,
    TextStyle? header5Regular,
    TextStyle? header6Regular,
    TextStyle? header6Bold,
    TextStyle? header7Medium,
    TextStyle? header8Medium,
    TextStyle? header9Medium,
    TextStyle? header9Regular,
    TextStyle? header10Medium,
    TextStyle? header10Regular,
    TextStyle? header11Medium,
    TextStyle? header12Medium,
    TextStyle? paragraph1Regular,
    TextStyle? paragraph2Medium,
    TextStyle? paragraph2Regular,
    TextStyle? paragraph3Medium,
    TextStyle? paragraph3Regular,
    TextStyle? paragraph4Regular,
    TextStyle? button1,
    TextStyle? button2,
    TextStyle? button3,
  }) {
    return AppThemeTextStyles(
      header1Medium: header1Medium ?? this.header1Medium,
      header2Medium: header2Medium ?? this.header2Medium,
      header3Bold: header3Bold ?? this.header3Bold,
      header4Medium: header4Medium ?? this.header4Medium,
      header5Regular: header5Regular ?? this.header5Regular,
      header6Regular: header6Regular ?? this.header6Regular,
      header6Bold: header6Bold ?? this.header6Bold,
      header7Medium: header7Medium ?? this.header7Medium,
      header8Medium: header8Medium ?? this.header8Medium,
      header9Medium: header9Medium ?? this.header9Medium,
      header9Regular: header9Regular ?? this.header9Regular,
      header10Medium: header10Medium ?? this.header10Medium,
      header10Regular: header10Regular ?? this.header10Regular,
      header11Medium: header11Medium ?? this.header11Medium,
      header12Medium: header12Medium ?? this.header12Medium,
      paragraph1Regular: paragraph1Regular ?? this.paragraph1Regular,
      paragraph2Medium: paragraph2Medium ?? this.paragraph2Medium,
      paragraph2Regular: paragraph2Regular ?? this.paragraph2Regular,
      paragraph3Medium: paragraph3Medium ?? this.paragraph3Medium,
      paragraph3Regular: paragraph3Regular ?? this.paragraph3Regular,
      paragraph4Regular: paragraph4Regular ?? this.paragraph4Regular,
      button1: button1 ?? this.button1,
      button2: button2 ?? this.button2,
      button3: button3 ?? this.button3,
    );
  }

  @override
  ThemeExtension<AppThemeTextStyles> lerp(
      ThemeExtension<AppThemeTextStyles> other, double t) {
    if (other is AppThemeTextStyles) {
      return AppThemeTextStyles(
        header1Medium: TextStyle.lerp(header1Medium, other.header1Medium, t),
        header2Medium: TextStyle.lerp(header2Medium, other.header2Medium, t),
        header3Bold: TextStyle.lerp(header3Bold, other.header3Bold, t),
        header4Medium: TextStyle.lerp(header4Medium, other.header4Medium, t),
        header5Regular: TextStyle.lerp(header5Regular, other.header5Regular, t),
        header6Regular: TextStyle.lerp(header6Regular, other.header6Regular, t),
        header6Bold: TextStyle.lerp(header6Bold, other.header6Bold, t),
        header7Medium: TextStyle.lerp(header7Medium, other.header7Medium, t),
        header8Medium: TextStyle.lerp(header8Medium, other.header8Medium, t),
        header9Medium: TextStyle.lerp(header9Medium, other.header9Medium, t),
        header9Regular: TextStyle.lerp(header9Regular, other.header9Regular, t),
        header10Medium: TextStyle.lerp(header10Medium, other.header10Medium, t),
        header10Regular:
            TextStyle.lerp(header10Regular, other.header10Regular, t),
        header11Medium: TextStyle.lerp(header11Medium, other.header11Medium, t),
        header12Medium: TextStyle.lerp(header12Medium, other.header12Medium, t),
        paragraph1Regular:
            TextStyle.lerp(paragraph1Regular, other.paragraph1Regular, t),
        paragraph2Medium:
            TextStyle.lerp(paragraph2Medium, other.paragraph2Medium, t),
        paragraph2Regular:
            TextStyle.lerp(paragraph2Regular, other.paragraph2Regular, t),
        paragraph3Medium:
            TextStyle.lerp(paragraph3Medium, other.paragraph3Medium, t),
        paragraph3Regular:
            TextStyle.lerp(paragraph3Regular, other.paragraph3Regular, t),
        paragraph4Regular:
            TextStyle.lerp(paragraph4Regular, other.paragraph4Regular, t),
        button1: TextStyle.lerp(button1, other.button1, t),
        button2: TextStyle.lerp(button2, other.button2, t),
        button3: TextStyle.lerp(button3, other.button3, t),
      );
    }
    return this;
  }
}
