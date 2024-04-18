import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/warning_dialog.dart';

import '../../dls/color/app_colors.dart';

class WarningDialog extends StatelessWidget {
  final String title;
  final String? subTitle;
  final VoidCallback? onCloseClick;
  final bool? hideCloseIcon;
  final String? buttonTitle;
  final VoidCallback? onButtonClick;

  const WarningDialog({
    super.key,
    required this.title,
    this.subTitle,
    this.onCloseClick,
    this.hideCloseIcon,
    this.buttonTitle,
    this.onButtonClick,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: AppColors.dialogBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      child: WarningWidget(
        title: title,
        subTitle: subTitle,
        onCloseClick: onCloseClick,
        hideCloseIcon: hideCloseIcon,
        buttonTitle: buttonTitle,
        onButtonClick: onButtonClick,
      ),
    );
  }
}
