
import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/legacy_app_color.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/legacy_app_textstyles.dart';

/// Following dialog used for showing alerts on screen
/// Update UI as required with new design
class SimpleAlertDialog extends StatelessWidget {
  final String title;
  final String subTitle;
  final String buttonTitle;
  final VoidCallback? onButtonClick;

  const SimpleAlertDialog({
    super.key,
    required this.title,
    required this.subTitle,
    this.onButtonClick,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: LegacyAppColor.alertDialogBackgroundColor,
      shape: const RoundedRectangleBorder(),
      title: Text(
        title,
        style: LegacyAppTextStyles.listTitleStyle16W500.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      titlePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      content: Text(
        subTitle,
        style: LegacyAppTextStyles.listTitleStyle14W500.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => onButtonClick?.call(),
          child: Text(buttonTitle,
              style: LegacyAppTextStyles.listTitleStyle14W500.copyWith(
                color: LegacyAppColor.okTextColot,
                fontWeight: FontWeight.bold,
              )),
        )
      ],
    );
  }
}
