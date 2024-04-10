import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Theme color tokens defined by the app.
class AppThemeColors extends ThemeExtension<AppThemeColors>
    with EquatableMixin {
  final Color? primary;
  final Color? secondary;
  final Color? offers;
  final Color? success;
  final Color? mediumStock;
  final Color? error;
  final Color? screenBackground;
  final Color? inputField;
  final Color? textPrimary;
  final Color? textSecondary;
  final Color? separatorPrimary;
  final Color? separatorSecondary;

  AppThemeColors({
    required this.primary,
    required this.secondary,
    required this.offers,
    required this.success,
    required this.mediumStock,
    required this.error,
    required this.screenBackground,
    required this.inputField,
    required this.textPrimary,
    required this.textSecondary,
    required this.separatorPrimary,
    required this.separatorSecondary,
  });

  @override
  ThemeExtension<AppThemeColors> copyWith({
    Color? primary,
    Color? secondary,
    Color? offers,
    Color? success,
    Color? mediumStock,
    Color? error,
    Color? screenBackground,
    Color? inputField,
    Color? textPrimary,
    Color? textSecondary,
    Color? separatorPrimary,
    Color? separatorSecondary,
  }) {
    return AppThemeColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      offers: offers ?? this.offers,
      success: success ?? this.success,
      mediumStock: mediumStock ?? this.mediumStock,
      error: error ?? this.error,
      screenBackground: screenBackground ?? this.screenBackground,
      inputField: inputField ?? this.inputField,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      separatorPrimary: separatorPrimary ?? this.separatorPrimary,
      separatorSecondary: separatorSecondary ?? this.separatorSecondary,
    );
  }

  @override
  ThemeExtension<AppThemeColors> lerp(
    ThemeExtension<AppThemeColors> other,
    double t,
  ) {
    if (other is AppThemeColors) {
      return AppThemeColors(
        primary: Color.lerp(primary, other.primary, t),
        secondary: Color.lerp(secondary, other.secondary, t),
        offers: Color.lerp(offers, other.offers, t),
        success: Color.lerp(success, other.success, t),
        mediumStock: Color.lerp(mediumStock, other.mediumStock, t),
        error: Color.lerp(error, other.error, t),
        screenBackground: Color.lerp(
          screenBackground,
          other.screenBackground,
          t,
        ),
        inputField: Color.lerp(inputField, other.inputField, t),
        textPrimary: Color.lerp(textPrimary, other.textPrimary, t),
        textSecondary: Color.lerp(textSecondary, other.textSecondary, t),
        separatorPrimary: Color.lerp(
          separatorPrimary,
          other.separatorPrimary,
          t,
        ),
        separatorSecondary: Color.lerp(
          separatorSecondary,
          other.separatorSecondary,
          t,
        ),
      );
    }
    return this;
  }

  @override
  List<Object?> get props => [
        primary,
        secondary,
        offers,
        success,
        mediumStock,
        error,
        screenBackground,
        inputField,
        textPrimary,
        textSecondary,
        separatorPrimary,
        separatorSecondary,
      ];

  @override
  bool? get stringify => true;
}
