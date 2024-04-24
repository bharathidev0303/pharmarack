import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/dls/color/app_colors.dart';

class CustomToast extends StatelessWidget {
  final String alertMessage;
  final AlertType alertType;
  final TextStyle textStyle;
  final Function closeCallBack;

  const CustomToast({
    super.key,
    required this.alertMessage,
    required this.alertType,
    required this.textStyle,
    required this.closeCallBack,
  });

  @override
  Widget build(BuildContext context) {
    Map<AlertType, Color> typeBoxColor = {
      AlertType.danger: const Color(0xFFC72C41),
      AlertType.error: const Color(0xFFF64B3C),
      AlertType.warning: const Color(0xFFEF8D32),
      AlertType.detail: const Color(0xFF4E8D7C),
      AlertType.info: const Color(0xFF3282B8),
      AlertType.success: const Color(0xFF2EA270),
      AlertType.primary: const Color(0xFF0070E0)
    };

    // Map<AlertType, Color> typeIconColor = {
    //   AlertType.danger: const Color(0xFF801336),
    //   AlertType.error: const Color(0xFFC81912),
    //   AlertType.warning: const Color(0xFFCC561E),
    //   AlertType.detail: const Color(0xFF3E7063),
    //   AlertType.info: const Color(0xFF0F4C75),
    //   AlertType.success: const Color(0xFF004E32),
    //   AlertType.primary: const Color(0xFF05478A)
    // };
    // 0xFF004E32

    return Container(
      height: 30,
      padding: const EdgeInsets.only(left: 8, right: 8),
      decoration: BoxDecoration(
        color: typeBoxColor[alertType],
        borderRadius: const BorderRadius.all(
          Radius.circular(0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              alertMessage,
              style: textStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          InkWell(
              onTap: () {
                closeCallBack();
              },
              child: const Icon(
                Icons.close,
                color: AppColors.white,
                size: 18,
              ))
        ],
      ),
    );
  }
}

enum AlertType { error, warning, success, info, primary, danger, detail }
