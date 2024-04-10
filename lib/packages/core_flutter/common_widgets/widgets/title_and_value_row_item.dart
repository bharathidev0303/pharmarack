import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pharmarack/gen/fonts.gen.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/app_text_style.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';

class TitleAndAmountRowItem extends StatelessWidget {
  final String value;
  final String title;
  final Color? textColor;
  final ValueTextType textType;

  const TitleAndAmountRowItem(
      {super.key,
      required this.value,
      required this.title,
      this.textColor,
      this.textType = ValueTextType.text});

  @override
  Widget build(BuildContext context) {
    String textValue = '';

    if (textType == ValueTextType.currency) {
      textValue = '₹$value';
    } else if (textType == ValueTextType.percentage) {
      textValue = '$value%';
    } else {
      textValue = value;
    }

    return value != ""
        ? Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: '$title: ',
                    style: kIsWeb
                        ? context.textStyles.header6Regular?.copyWith(
                            color: textColor ?? AppColors.lightGrey,
                          )
                        : AppTextStyles.style12W700Black(
                            color: textColor ?? AppColors.lightGrey,
                          )),
                TextSpan(
                    text: textValue,
                    style: kIsWeb
                        ? context.textStyles.header6Bold?.copyWith(
                            fontFamily: AppFontFamily.helveticaNeueRegular,
                            color: textColor ?? AppColors.primaryTextColor,
                          )
                        : AppTextStyles.style11W500MedGrey(
                            color: textColor ?? AppColors.primaryTextColor,
                          ).copyWith(fontWeight: FontWeight.w300)),
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}

enum ValueTextType { text, percentage, currency }
