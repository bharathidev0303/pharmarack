
import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';

class CommonSnackBar {
  static SnackBar _getSnackBar({
    required String title,
    String? actionLabelTitle,
    void Function()? actionCallback,
    Duration? duration,
  }) {
    return SnackBar(
      content: Text(title),
      action: actionLabelTitle != null
          ? SnackBarAction(
              label: actionLabelTitle,
              onPressed: () => actionCallback?.call(),
            )
          : null,
      duration: duration ?? const Duration(milliseconds: 4000),
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showSnackBar({
    required String title,
    required BuildContext context,
    String? actionLabelTitle,
    void Function()? actionCallback,
    Duration? duration,
  }) {
    return ScaffoldMessenger.of(context).showSnackBar(
      _getSnackBar(
        title: title,
        actionCallback: actionCallback,
        actionLabelTitle: actionLabelTitle,
        duration: duration,
      ),
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showFloatingSnackBar(
    BuildContext context,
    String title, {
    EdgeInsetsGeometry margin =
        const EdgeInsets.only(left: 25, right: 25, bottom: 17),
  }) {
    SnackBar snackBar = SnackBar(
      elevation: 0,
      content: Text(
        title,
        style: context.textStyles.header7Medium?.copyWith(
          color: context.colors.offers,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      dismissDirection: DismissDirection.horizontal,
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.snackBarBackgroundColor,
      margin: margin,
    );
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
