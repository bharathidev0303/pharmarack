
import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/widget/primary_button.dart';
import 'package:pharmarack/gen/assets.gen.dart';

import '../color/app_colors.dart';
import '../text_utils/app_text_style.dart';

/// A widgets to show no records found image.
class NoRecordsFound extends StatelessWidget {
  final String? message;
  final String? buttonTitle;
  final Widget? icons;
  final Function? buttonCallBack;

  const NoRecordsFound(
      {super.key,
      this.buttonTitle,
      this.icons,
      this.message,
      this.buttonCallBack});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icons ??
            AppAssets.png.noRecordsFound.image(
              package: 'core_flutter',
            ),
        const SizedBox(
          height: 8,
        ),
        Text(
          message ?? '',
          style: AppTextStyles.textFieldNameStyle12W500.copyWith(fontSize: 18),
        ),
        const SizedBox(
          height: 8,
        ),
        buttonTitle != null
            ? PrimaryButton(
                text: buttonTitle ?? '',
                width: 132,
                color: AppColors.blueButtonColor,
                onPressed: () {
                  buttonCallBack!();
                },
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
