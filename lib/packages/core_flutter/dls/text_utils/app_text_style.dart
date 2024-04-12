import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_fonts.dart';
import 'package:pharmarack/gen/fonts.gen.dart';

class AppTextStyles {
  static String helveticaNeueRegular = AppFonts.helveticaNeue;

  static TextStyle style16W600Black({Color? color}) {
    return TextStyle(
        color: color ?? Colors.black,
        fontSize: 22,
        fontFamily: helveticaNeueRegular,
        fontWeight: FontWeight.w600);
  }

  static TextStyle dialogTitleTextStyle20W700 = const TextStyle(
    color: AppColors.blackTextFieldText,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: AppFontFamily.helveticaNeueRegular,
  );

  static TextStyle style20W700 = const TextStyle(
    color: AppColors.secondaryTextColor,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontFamily: AppFontFamily.helveticaNeueRegular,
    fontStyle: FontStyle.normal,
  );

  static TextStyle style16W500 = const TextStyle(
    color: AppColors.blackTextFieldText,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: AppFontFamily.helveticaNeueRegular,
    fontStyle: FontStyle.normal,
    height: 1.192, // 13.12/11
  );

  static TextStyle style20BoldBlack({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: 20,
      fontFamily: AppFonts.inter,
      fontWeight: FontWeight.bold,
      height: 0,
    );
  }

  static TextStyle appBarTitleTextStyle18W500Black = TextStyle(
    color: AppColors.primaryTextColor,
    fontSize: 18.0,
    fontWeight: FontWeight.w500,
    fontFamily: helveticaNeueRegular,
  );

  static TextStyle style18W500 = const TextStyle(
    color: AppColors.dashboardTitleColor,
    fontSize: 18,
    fontFamily: AppFontFamily.helveticaNeueRegular,
    fontWeight: FontWeight.w500,
    height: 0,
  );

  static TextStyle style18W500Grey({Color? color}) {
    return TextStyle(
      color: color ?? AppColors.lightGrey,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontFamily: AppFontFamily.helveticaNeueRegular,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle style16W700Black({
    Color? color,
  }) {
    return TextStyle(
        color: color ?? AppColors.primaryTextColor,
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        fontFamily: helveticaNeueRegular,
        fontStyle: FontStyle.normal,
        height: 0);
  }

  static TextStyle style16W700BlackRegular({
    Color? color,
  }) {
    return TextStyle(
        color: color ?? AppColors.primaryTextColor,
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        height: 0);
  }

  static TextStyle dialogTitleStyle16W400 = const TextStyle(
    color: AppColors.primaryTextColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: AppFontFamily.helveticaNeueRegular,
    fontStyle: FontStyle.normal,
    height: 1.1875, // 19/16
  );

  static TextStyle listItemStyle16W700Black({
    Color? color,
  }) {
    return TextStyle(
        color: color ?? AppColors.lightGrey,
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        height: 0);
  }

  static TextStyle style16W400Black({
    Color? color,
  }) {
    return TextStyle(
        color: color ?? AppColors.primaryTextColor,
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        fontFamily: helveticaNeueRegular,
        fontStyle: FontStyle.normal,
        height: 0);
  }

  static TextStyle style14W500Black({
    Color? color,
  }) {
    return TextStyle(
        color: color ?? AppColors.primaryTextColor,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        fontFamily: helveticaNeueRegular,
        fontStyle: FontStyle.normal,
        height: 0);
  }

  static TextStyle searchHintTextStyle15W400Black() {
    return const TextStyle(
      color: Colors.black45,
      fontSize: 15,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle textStyleBlack15w400(
    Color? color,
  ) {
    return TextStyle(
      color: color ?? AppColors.primaryTextColor,
      fontSize: 15,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle listItemValueStyle12W500 = const TextStyle(
    color: AppColors.primaryTextColor,
    fontSize: 15,
    fontWeight: FontWeight.w300,
    fontFamily: AppFontFamily.helveticaNeueRegular,
  );

  static TextStyle searchOrderHistoryHintTextStyleW700({Color? color}) {
    return TextStyle(
      fontSize: 14,
      color: color ?? AppColors.searchHintColor,
      fontWeight: FontWeight.w700,
      fontFamily: helveticaNeueRegular,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle textBottomSheetValue14W500 = const TextStyle(
    color: AppColors.cardTitleColor,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: AppFontFamily.helveticaNeueRegular,
    fontStyle: FontStyle.normal,
  );

  static TextStyle style12NormalBlack({
    Color? color,
  }) {
    return TextStyle(
      color: color ?? AppColors.primaryTextColor,
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      fontFamily: helveticaNeueRegular,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle style14NormalBlack({
    Color? color,
  }) {
    return TextStyle(
      color: color ?? AppColors.primaryTextColor,
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      fontFamily: helveticaNeueRegular,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle style14W400 = const TextStyle(
    color: AppColors.secondaryTextColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: AppFontFamily.helveticaNeueRegular,
    fontStyle: FontStyle.normal,
    height: 1.2142857, // 17/14
  );

  static TextStyle textBottomSheetLabel14W400 = const TextStyle(
    color: AppColors.cardTitleColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: AppFontFamily.helveticaNeueRegular,
    fontStyle: FontStyle.normal,
  );

  static TextStyle searchTextStyle14W400({Color? color}) {
    return TextStyle(
      fontSize: 14,
      color: color ?? AppColors.blackTextFieldText,
      fontWeight: FontWeight.w400,
      fontFamily: helveticaNeueRegular,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle searchHintTextStyleW400({Color? color}) {
    return TextStyle(
      fontSize: 14,
      color: color ?? AppColors.searchHintColor,
      fontWeight: FontWeight.w400,
      fontFamily: helveticaNeueRegular,
      fontStyle: FontStyle.normal,
    );
  }

  static const TextStyle style12W500 = TextStyle(
    color: AppColors.statusTextColor,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: AppFontFamily.helveticaNeueRegular,
    fontStyle: FontStyle.normal,
    height: 1.25, // 15/12
  );
  static const TextStyle styleRed12W500 = TextStyle(
    color: AppColors.redErrorTextColor,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: AppFontFamily.helveticaNeueRegular,
    fontStyle: FontStyle.normal,
    height: 1.25, // 15/12
  );

  static TextStyle listItemSecondaryTextStyleInter10W600 = const TextStyle(
    color: AppColors.blackTextFieldText,
    fontSize: 12.0,
    fontWeight: FontWeight.w700,
    fontFamily: AppFontFamily.inter,
    height: 0,
  );

  static TextStyle buttonTextStyleW700({
    Color? color,
  }) {
    return TextStyle(
      color: color ?? AppColors.primaryColor,
      fontSize: 12,
      fontFamily: AppFontFamily.helveticaNeueRegular,
      fontWeight: FontWeight.w700,
      height: 0,
    );
  }

  static TextStyle style12W700Black({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
        color: color ?? AppColors.primaryTextColor,
        fontSize: fontSize ?? 12.0,
        fontWeight: fontWeight ?? FontWeight.w700,
        fontFamily: helveticaNeueRegular,
        fontStyle: FontStyle.normal,
        height: 0);
  }

  static TextStyle selectedTabTextStyle12W500() {
    return TextStyle(
        color: Colors.white,
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        fontFamily: helveticaNeueRegular,
        fontStyle: FontStyle.normal,
        height: 0);
  }

  static TextStyle style12W500Black({Color? color, FontWeight? weight}) {
    return TextStyle(
      color: color ?? AppColors.primaryTextColor,
      fontSize: 12.0,
      fontWeight: weight ?? FontWeight.w500,
      fontFamily: helveticaNeueRegular,
    );
  }

  static TextStyle buttonTextStyle12W500({
    Color? color,
  }) {
    return TextStyle(
        color: color ?? Colors.white,
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        fontFamily: helveticaNeueRegular,
        fontStyle: FontStyle.normal,
        height: 0);
  }

  static TextStyle textFieldNameStyle12W500 = const TextStyle(
    color: AppColors.secondaryTextColor,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: AppFontFamily.helveticaNeueRegular,
    fontStyle: FontStyle.normal,
  );

  static TextStyle viewAllStyle12W500 = const TextStyle(
    color: AppColors.dashboardSubTitleColor,
    fontSize: 12,
    fontFamily: AppFontFamily.helveticaNeueRegular,
    fontWeight: FontWeight.w500,
    height: 0,
  );

  static TextStyle searchFilterTextStyleW500 = const TextStyle(
    color: AppColors.onboardingStepperSelectedColor,
    fontSize: 12,
    fontFamily: AppFontFamily.helveticaNeueRegular,
    fontWeight: FontWeight.w500,
  );

  static TextStyle dialogActionStyle12W500 = const TextStyle(
    color: AppColors.white,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: AppFontFamily.helveticaNeueRegular,
    fontStyle: FontStyle.normal,
    height: 1.25, // 15/12
  );

  static TextStyle blueLinkTextStyle = const TextStyle(
    color: AppColors.blueLinkTextColor,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );

  static TextStyle unSelectedTabTextStyle12W400() {
    return TextStyle(
        color: AppColors.primaryTextColor,
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        fontFamily: helveticaNeueRegular,
        fontStyle: FontStyle.normal,
        height: 0);
  }

  static TextStyle textFieldNameStyle12W400 = const TextStyle(
    color: AppColors.cardTitleColor,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: AppFontFamily.helveticaNeueRegular,
  );

  static TextStyle dialogSubTitleTextStyle12W400 = TextStyle(
    fontSize: 12,
    color: AppColors.searchHintColor,
    fontWeight: FontWeight.w400,
    fontFamily: helveticaNeueRegular,
    fontStyle: FontStyle.normal,
  );

  static TextStyle dialogSubTitleTextStyle14W700 = TextStyle(
    fontSize: 14,
    color: AppColors.searchHintColor,
    fontWeight: FontWeight.w700,
    fontFamily: helveticaNeueRegular,
    fontStyle: FontStyle.normal,
  );

  static TextStyle style12W400 = const TextStyle(
    color: AppColors.secondaryTextColor,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    fontFamily: AppFontFamily.helveticaNeueRegular,
    fontStyle: FontStyle.normal,
    height: 1.1933333, // 14.32/12
  );

  static TextStyle dashboardTileStyle12W400 = const TextStyle(
    color: AppColors.dashboardTileTitleColor,
    fontSize: 12,
    fontFamily: AppFontFamily.helveticaNeueRegular,
    fontWeight: FontWeight.w400,
  );

  static TextStyle searchFilterTitleStyleW300 = const TextStyle(
    color: AppColors.secondaryTextColor,
    fontSize: 12,
    fontFamily: AppFontFamily.helveticaNeueRegular,
    fontWeight: FontWeight.w300,
  );

  static TextStyle downloadInvoiceTextStyle11W500 = const TextStyle(
    color: AppColors.blueButtonColor,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    fontFamily: AppFontFamily.helveticaNeueRegular,
  );

  static TextStyle richTextSubtitleTextStyle11W500 = const TextStyle(
    color: AppColors.blackTextFieldText,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    fontFamily: AppFontFamily.helveticaNeueRegular,
  );

  static TextStyle style11W500MedGrey({Color? color}) {
    return TextStyle(
        color: color ?? AppColors.mediumGreyText,
        fontSize: 11,
        fontFamily: helveticaNeueRegular,
        fontWeight: FontWeight.w500);
  }

  static TextStyle tabTitleTextStyle({Color? color}) {
    return TextStyle(
      color: color ?? Colors.white,
      fontSize: 11,
      fontFamily: helveticaNeueRegular,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle style11RegularBlack({
    Color? color,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
        color: color ?? Colors.black,
        fontSize: 11.0,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontFamily: helveticaNeueRegular,
        fontStyle: FontStyle.normal,
        height: 0);
  }

  static TextStyle style11W400 = const TextStyle(
    color: AppColors.secondaryTextColor,
    fontSize: 11,
    fontWeight: FontWeight.w400,
    fontFamily: AppFontFamily.helveticaNeueRegular,
    fontStyle: FontStyle.normal,
    height: 1.1927273, // 13.12/11
  );

  static TextStyle style11W400Red({Color? color}) {
    return TextStyle(
      color: color ?? AppColors.redErrorColor,
      fontSize: 11,
      fontFamily: helveticaNeueRegular,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
    );
  }

  static TextStyle searchHintTextStyle11W400({Color? color}) {
    return TextStyle(
      fontSize: 11,
      color: color ?? AppColors.searchHintColor,
      fontWeight: FontWeight.w400,
      fontFamily: helveticaNeueRegular,
      fontStyle: FontStyle.normal,
    );
  }

  static TextStyle textFieldNameStyle11W500 = const TextStyle(
    color: AppColors.secondaryTextColor,
    fontSize: 11,
    fontWeight: FontWeight.w300,
    fontFamily: AppFontFamily.helveticaNeueRegular,
    fontStyle: FontStyle.normal,
    height: 1.2209, // 13.43/11
  );

  static TextStyle textFieldNameStyle11W300 = const TextStyle(
    color: AppColors.secondaryTextColor,
    fontSize: 11,
    fontWeight: FontWeight.w300,
    fontFamily: AppFontFamily.helveticaNeueRegular,
    fontStyle: FontStyle.normal,
    height: 1.2209, // 13.43/11
  );

  static TextStyle primaryButtonTextStyle10W600({
    Color? color,
  }) {
    return TextStyle(
        color: color ?? Colors.white,
        fontSize: 10.0,
        fontWeight: FontWeight.w600,
        fontFamily: AppFonts.inter,
        fontStyle: FontStyle.normal,
        height: 0);
  }

  static TextStyle style10W500Blue({
    Color? color,
  }) {
    return TextStyle(
        color: color ?? AppColors.textBlueColor,
        fontSize: 10.0,
        fontWeight: FontWeight.w500,
        fontFamily: helveticaNeueRegular,
        height: 0);
  }

  static TextStyle style10W500Orange({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    TextDecoration textDecoration = TextDecoration.none,
  }) {
    return TextStyle(
      color: color ?? AppColors.primaryOrangeColor,
      fontSize: 10,
      fontFamily: AppFonts.inter,
      fontWeight: FontWeight.w500,
      decoration: textDecoration,
      height: 0,
    );
  }

  static TextStyle style10W400Grey({
    Color? color,
  }) {
    return TextStyle(
        color: color ?? AppColors.greyText,
        fontSize: 10.0,
        fontWeight: FontWeight.w400,
        fontFamily: helveticaNeueRegular,
        fontStyle: FontStyle.normal,
        height: 0);
  }

  static TextStyle style10W500Black({
    Color? color,
  }) {
    return TextStyle(
        color: color ?? AppColors.primaryTextColor,
        fontSize: 10.0,
        fontWeight: FontWeight.w400,
        fontFamily: helveticaNeueRegular,
        fontStyle: FontStyle.normal,
        height: 0);
  }

  static TextStyle style10W400White({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
        color: color ?? Colors.white,
        fontSize: fontSize ?? 10.0,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontFamily: helveticaNeueRegular,
        fontStyle: FontStyle.normal,
        height: 0);
  }

  static TextStyle listSectionHeaderStyle10W500Black({
    Color? color,
  }) {
    return TextStyle(
        color: color ?? AppColors.lightGrey,
        fontSize: 10.0,
        fontWeight: FontWeight.w400,
        fontFamily: helveticaNeueRegular,
        fontStyle: FontStyle.normal,
        height: 0);
  }

  static TextStyle listItemStyle10W500Black({
    Color? color,
  }) {
    return TextStyle(
        color: color ?? AppColors.lightGrey,
        fontSize: 10.0,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        height: 0);
  }

  static TextStyle bottomNavigationSelectedTextStyle = const TextStyle(
    color: AppColors.blueButtonColor,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontFamily: AppFontFamily.helveticaNeueRegular,
    fontStyle: FontStyle.normal,
    height: 1.1875, // 19/16
  );

  static TextStyle bottomNavigationUnselectedTextStyle = const TextStyle(
    color: AppColors.primaryTextColor,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontFamily: AppFontFamily.helveticaNeueRegular,
    fontStyle: FontStyle.normal,
    height: 1.1875, // 19/16
  );

  static TextStyle style10W400 = const TextStyle(
    color: AppColors.secondaryTextColor,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    fontFamily: AppFontFamily.helveticaNeueRegular,
    fontStyle: FontStyle.normal,
    height: 1.2, // 12/10
  );

  static TextStyle title24Black() {
    return TextStyle(
        color: Colors.black,
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        fontFamily: helveticaNeueRegular,
        fontStyle: FontStyle.normal,
        height: 0);
  }
}
