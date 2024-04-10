import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/app_theme_colors.dart';

import 'app_theme_text_styles.dart';

extension ThemeExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  AppThemeColors get colors {
    final colors = theme.extension<AppThemeColors>();
    if (colors == null) {
      throw Exception('AppThemeColors extension not found in theme');
    } else {
      return colors;
    }
  }

  AppThemeTextStyles get textStyles {
    final textStyles = theme.extension<AppThemeTextStyles>();
    if (textStyles == null) {
      throw Exception('AppThemeTextStyles extension not found in theme');
    } else {
      return textStyles;
    }
  }
}
