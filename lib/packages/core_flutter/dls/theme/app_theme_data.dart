import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/color_palette.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/legacy_app_color.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/helvetica_text_styles.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/app_theme_text_styles.dart';

import '../color/app_colors.dart';
import 'app_theme_colors.dart';

/// Theme data for the app
abstract final class AppThemeData {
  /// Text styles, which are common across light/dark themes

  static final CheckboxThemeData _checkboxTheme = CheckboxThemeData(
    checkColor: MaterialStateProperty.all(Colors.orange),
    fillColor: MaterialStateProperty.all(Colors.transparent),
    side: MaterialStateBorderSide.resolveWith(
      (states) => const BorderSide(color: Colors.orange, width: 2),
    ),
  );
  static const InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: LegacyAppColor.borderColor),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 16),
    hintStyle: TextStyle(
      color: LegacyAppColor.textFieldHint,
      fontSize: 15,
      fontStyle: FontStyle.normal,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
  );
  static const ProgressIndicatorThemeData _progressIndicatorTheme =
      ProgressIndicatorThemeData(color: AppColors.primaryColor);

  /// Light visual properties for the app. Includes colors, typography, shapes etc.
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(),
    extensions: <ThemeExtension<dynamic>>[
      _getLightAppThemeColors(),
      _getHelveticaAppThemeTextStyles(),
    ],
    checkboxTheme: _checkboxTheme,
    inputDecorationTheme: _inputDecorationTheme,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.grey[900],
      selectionColor: Colors.black.withOpacity(0.5),
      selectionHandleColor: Colors.grey[900],
    ),
    progressIndicatorTheme: _progressIndicatorTheme,
  );

  static AppThemeColors _getLightAppThemeColors() {
    return AppThemeColors(
      primary: ColorPalette.blue,
      secondary: ColorPalette.lightBlue,
      offers: ColorPalette.orange,
      success: ColorPalette.green,
      mediumStock: ColorPalette.blue500,
      error: ColorPalette.red,
      screenBackground: ColorPalette.grey100,
      inputField: ColorPalette.grey200,
      textPrimary: ColorPalette.black,
      textSecondary: ColorPalette.grey400,
      separatorPrimary: ColorPalette.grey200,
      separatorSecondary: ColorPalette.grey300,
    );
  }

  static AppThemeTextStyles _getHelveticaAppThemeTextStyles() {
    return AppThemeTextStyles(
      header1Medium: HelveticaTextStyles.header1Medium,
      header2Medium: HelveticaTextStyles.header2Medium,
      header3Bold: HelveticaTextStyles.header3Bold,
      header4Medium: HelveticaTextStyles.header4Medium,
      header5Regular: HelveticaTextStyles.header5Regular,
      header6Regular: HelveticaTextStyles.header6Regular,
      header6Bold: HelveticaTextStyles.header6Bold,
      header7Medium: HelveticaTextStyles.header7Medium,
      header8Medium: HelveticaTextStyles.header8Medium,
      header9Medium: HelveticaTextStyles.header9Medium,
      header9Regular: HelveticaTextStyles.header9Regular,
      header10Medium: HelveticaTextStyles.header10Medium,
      header10Regular: HelveticaTextStyles.header10Regular,
      header11Medium: HelveticaTextStyles.header11Medium,
      header12Medium: HelveticaTextStyles.header12Medium,
      paragraph1Regular: HelveticaTextStyles.paragraph1Regular,
      paragraph2Medium: HelveticaTextStyles.paragraph2Medium,
      paragraph2Regular: HelveticaTextStyles.paragraph2Regular,
      paragraph3Medium: HelveticaTextStyles.paragraph3Medium,
      paragraph3Regular: HelveticaTextStyles.paragraph3Regular,
      paragraph4Regular: HelveticaTextStyles.paragraph4Regular,
      button1: HelveticaTextStyles.button1,
      button2: HelveticaTextStyles.button2,
      button3: HelveticaTextStyles.button3,
    );
  }
}
