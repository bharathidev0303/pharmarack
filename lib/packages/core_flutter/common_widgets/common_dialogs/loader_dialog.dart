
import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/legacy_app_color.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/legacy_app_textstyles.dart';

/// Following dialog used for API calls showing loader on screen
/// Update UI as required with new design
class LoaderDialog extends StatelessWidget {
  final String title;
  final String subTitle;

  const LoaderDialog({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: LegacyAppColor.loaderAlertDialogBackgroundColor,
      shape: const RoundedRectangleBorder(),
      titlePadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      title: Text(
        title,
        style: LegacyAppTextStyles.listTitleStyle16W500.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Row(
        children: [
          const CircularProgressIndicator(
            color: LegacyAppColor.circularLoaderColor,
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            subTitle,
            style: LegacyAppTextStyles.listTitleStyle14W500.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
