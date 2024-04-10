
import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/legacy_app_color.dart';
import 'package:pharmarack/packages/core_flutter/dls/text_utils/legacy_app_textstyles.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/core_flutter/utils/url_launcher_utils.dart';

class BottomNavBar extends StatelessWidget {
  final Color? bottomNavColor;
  final Color? callIconColor;
  final Color? feedbackIconColor;
  final TextStyle? textStyle;

  const BottomNavBar({
    super.key,
    this.bottomNavColor,
    this.callIconColor,
    this.feedbackIconColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      color: bottomNavColor ?? LegacyAppColor.bottomNavColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => launchMobileNumber("02067660011"),
            child: Icon(
              Icons.call,
              color: callIconColor ?? Colors.white,
            ),
          ),
          Expanded(
            child: Text(
              context.localizedString
                  .bottomNavContentTitle(DateTime.now().year),
              textAlign: TextAlign.center,
              style: textStyle ??
                  LegacyAppTextStyles.bottomNavTitleStyle12.copyWith(
                    color: Colors.white,
                  ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.chat,
              color: feedbackIconColor ?? Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
