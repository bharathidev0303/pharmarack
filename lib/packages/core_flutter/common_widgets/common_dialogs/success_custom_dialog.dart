import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/success_widget.dart';

import '../../dls/color/app_colors.dart';

class SuccessDialog extends StatelessWidget {
  final String title;
  final String? subTitle;
  final VoidCallback? onCloseClick;
  final bool? hideCloseIcon;
  final bool? autoClose;
  final int? secondsToclose;

  const SuccessDialog({
    super.key,
    required this.title,
    this.subTitle,
    this.onCloseClick,
    this.hideCloseIcon,
    this.autoClose,
    this.secondsToclose,
  });

  @override
  Widget build(BuildContext context) {
    if (autoClose == true && hideCloseIcon == false) {
      autoClosePopUp(context, secondsToclose!);
    }

    return Dialog(
      surfaceTintColor: AppColors.dialogBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 24,
      ),
      child: SuccessWidget(
        title: title,
        subTitle: subTitle,
        onCloseClick: onCloseClick,
        hideCloseIcon: hideCloseIcon,
      ),
    );
  }

  autoClosePopUp(BuildContext context, int secondsToclose) async {
    await Future.delayed(
        Duration(seconds: secondsToclose != 0 ? secondsToclose : 3));
    Navigator.pop(context);
  }
}
