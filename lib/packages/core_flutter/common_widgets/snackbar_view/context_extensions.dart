import 'package:flutter/material.dart';
import 'custom_toast.dart';

extension ContextExtension on BuildContext {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showToastySnackbar(
      TextStyle textStyle, String message, AlertType type) {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: CustomToast(
          alertMessage: message,
          alertType: type,
          textStyle: textStyle,
          closeCallBack: () {
            ScaffoldMessenger.of(this).hideCurrentSnackBar();
          },
        ),
        behavior: SnackBarBehavior.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
