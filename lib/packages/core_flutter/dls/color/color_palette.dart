import 'dart:ui';

/// Temporary class used to represent the DLS colors outside of theme context
/// while [AppColors] usage is being migrated to [AppThemeColors]
/// Should be named after color name, not usage
///   ✅ purple, blue50, yellow900
///   ❌ primary, accent, background
abstract class ColorPalette {
  static const Color blue = Color(0xFF1439BB);
  static const Color lightBlue = Color(0xFFE4E9FA);
  static const Color orange = Color(0xFFFF7E00);
  static const Color green = Color(0xFF2EA270);
  static const Color blue500 = Color(0xFF0F8CD2);
  static const Color red = Color(0xFFE93A3A);
  static const Color black = Color(0xFF030303);
  static const Color grey100 = Color(0xFFF6F6F6);
  static const Color grey200 = Color(0xFFE2E4E9);
  static const Color grey300 = Color(0xFFC1C4D2);
  static const Color grey400 = Color(0xFF9193A1);
}
