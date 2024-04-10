import 'package:flutter/material.dart';

import '../color/legacy_app_color.dart';
import 'app_fonts.dart';

class LegacyAppTextStyles {
  static String fontAwesomeWebFont = AppFonts.fontAwesome;

  static TextStyle listTitleStyle14W500 = TextStyle(
      color: LegacyAppColor.primaryTextColor,
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      fontFamily: fontAwesomeWebFont,
      fontStyle: FontStyle.normal,
      height: 0);

  static TextStyle listTitleStyle16W500 = TextStyle(
      color: LegacyAppColor.primaryTextColor,
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      fontFamily: fontAwesomeWebFont,
      fontStyle: FontStyle.normal,
      height: 0);

  static TextStyle bottomNavTitleStyle12 = TextStyle(
      color: LegacyAppColor.primaryTextColor,
      fontSize: 12.0,
      fontFamily: fontAwesomeWebFont,
      fontStyle: FontStyle.normal,
      height: 0);
}
