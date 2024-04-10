import 'package:flutter/material.dart';

import '../../dls/text_utils/app_text_style.dart';

class ListItemRichText extends StatelessWidget {
  final String label;
  final String value;
  final Color primaryTextColor;
  final double primaryTextFontSize;
  final double secondaryTextFontSize;
  final Color secondaryTextColor;
  final void Function()? onViewTap;

  const ListItemRichText(
      {super.key,
      required this.label,
      required this.value,
      required this.primaryTextColor,
      required this.primaryTextFontSize,
      required this.secondaryTextFontSize,
      required this.secondaryTextColor,
      this.onViewTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        key: const Key('view tap'),
        child: RichText(
            text: TextSpan(
                style: AppTextStyles.listItemStyle10W500Black(
                        color: primaryTextColor)
                    .copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: primaryTextFontSize),
                children: <TextSpan>[
              TextSpan(text: label),
              TextSpan(
                  text: value,
                  style: AppTextStyles.listItemStyle10W500Black(
                          color: secondaryTextColor)
                      .copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: secondaryTextFontSize)),
            ])),
        onTap: () {
          onViewTap!();
        });
  }
}
