import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/login_entity.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/failure_custom_dialog.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/image_picker_dialog.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/loader_dialog.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/processing_request_dialog.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/request_failed_dialog.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/simple_dialog.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/simple_dialog_with_binary_buttons.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/success_custom_dialog.dart';
import 'package:pharmarack/packages/core_flutter/common_widgets/common_dialogs/warning_dialog_card.dart';
import 'package:pharmarack/packages/core_flutter/core/ui/device_detector_widget.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common_local_data_source/local_data_source.dart';
import '../../di/core_flutter_provider.dart';
import 'simple_dialog_with_image_buttons.dart';

class CommonDialogs {
  static showSimpleDialog(
      {required BuildContext parentContext,
      required String title,
      required String subTitle,
      required String buttonTitle,
      VoidCallback? onButtonClick,
      bool barrierDismissible = false}) {
    /// Following condition check if any pop-up is shown on current screen
    /// and avoids showing dialog
    if (ModalRoute.of(parentContext)?.isCurrent == true) {
      showDialog(
        context: parentContext,
        barrierDismissible: barrierDismissible,
        builder: (BuildContext context) => SimpleAlertDialog(
            title: title,
            subTitle: subTitle,
            buttonTitle: buttonTitle,
            onButtonClick: () {
              onButtonClick?.call();
              closeCommonDialog(context: parentContext);
            }),
      );
    }
  }

  static showLoader(
      {required BuildContext parentContext,
      String? title,
      String? subTitle,
      bool barrierDismissible = false}) {
    /// Following condition check if any pop-up is shown on current screen
    /// and avoids showing dialog
    if (ModalRoute.of(parentContext)?.isCurrent == true) {
      showDialog(
        context: parentContext,
        useRootNavigator: false,
        barrierDismissible: barrierDismissible,
        builder: (BuildContext context) => LoaderDialog(
          title: title ?? context.localizedString.pleaseWait,
          subTitle: subTitle ?? context.localizedString.connectingToServer,
        ),
      );
    }
  }

  static closeCommonDialog({required BuildContext context}) {
    /// when alert is displayed it is actually a new route being pushed to the
    /// screen which means that current route is alert dialog and not the screen
    if (ModalRoute.of(context)?.isCurrent != true) {
      /// if there is alert dialog open, close it!
      Navigator.pop(context);
    }
  }
}

Future showSuccessDialog(
  BuildContext context, {
  required String title,
  required String subtitle,
  VoidCallback? closeClick,
  bool barrierDismissible = true,
  bool userRootNavigator = true,
  bool hideCloseIcon = false,
  bool? autoClose = false,
  int? secondsToclose = 0,
}) {
  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    useRootNavigator: userRootNavigator,
    builder: (context) {
      return SuccessDialog(
        key: const Key(AppConstants.commonSuccessDialogKey),
        title: title,
        subTitle: subtitle,
        onCloseClick: closeClick,
        hideCloseIcon: hideCloseIcon,
        autoClose: autoClose,
        secondsToclose: secondsToclose,
      );
    },
  );
}

Future showWarningDialog(
  BuildContext context, {
  required String title,
  required String subtitle,
  required String buttonTitle,
  bool? hideCloseIcon,
  VoidCallback? closeClick,
  VoidCallback? onButtonClick,
  bool barrierDismissible = false,
  bool userRootNavigator = true,
}) {
  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    useRootNavigator: userRootNavigator,
    builder: (context) {
      return WarningDialog(
        key: const Key(AppConstants.commonSuccessDialogKey),
        title: title,
        subTitle: subtitle,
        onCloseClick: closeClick,
        hideCloseIcon: hideCloseIcon,
        buttonTitle: buttonTitle,
        onButtonClick: onButtonClick,
      );
    },
  );
}

void showBinaryButtonAlertDialog(BuildContext context,
    {String? title,
    FontWeight? titleFontWeight,
    required String subTitle,
    VoidCallback? onFirstButtonClick,
    VoidCallback? onSecondButtonClick,
    String? firstButtonTitle,
    String? secondButtonTitle,
    bool? isCrossIconHide}) {
  showAdaptiveDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          iconPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          buttonPadding: EdgeInsets.zero,
          content: SimpleAlertDialogWithBinaryButton(
            title: title ?? '',
            titleFontWeight: titleFontWeight,
            subTitle: subTitle,
            onFirstButtonClick: onFirstButtonClick,
            onSecondButtonClick: onSecondButtonClick,
            firstButtonTitle: firstButtonTitle ?? '',
            secondButtonTitle: secondButtonTitle ?? '',
            isCrossIconHide: isCrossIconHide,
          ),
        );
      });
}

void showImageButtonAlertDialog(BuildContext context,
    {required String title,
    FontWeight? titleFontWeight,
    required String subTitle,
    VoidCallback? onFirstButtonClick,
    required String firstButtonTitle,
    required String secondButtonTitle}) {
  showAdaptiveDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          iconPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          buttonPadding: EdgeInsets.zero,
          content: SimpleAlertDialogWithImageButton(
            title: title,
            titleFontWeight: titleFontWeight,
            subTitle: subTitle,
            onFirstButtonClick: onFirstButtonClick,
            firstButtonTitle: firstButtonTitle,
            secondButtonTitle: secondButtonTitle,
          ),
        );
      });
}

void showFailureDialog(
  BuildContext context, {
  required String title,
  required String subtitle,
  Function? closeClick,
}) {
  showAdaptiveDialog(
    context: context,
    barrierDismissible: false,
    builder: (ctx) {
      return Dialog(
        key: const Key(AppConstants.commonFailureDialogKey),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        insetPadding: EdgeInsets.zero,
        child: DeviceDetectorWidget(
          phoneView: () => FailureCustomDialog(
            title: title,
            subTitle: subtitle,
            onCloseClick: () {
              closeClick?.call();
            },
          ),
          webSiteView: () => FailureCustomDialog(
            title: title,
            subTitle: subtitle,
            onCloseClick: () {
              closeClick?.call();
            },
            dialogWidth: 360,
          ),
        ),
      );
    },
  );
}

void showAlertDialog(
    BuildContext context, String action, bool crossIconHide) async {
  showBinaryButtonAlertDialog(
    context,
    title: context.localizedString.logOutAlertTitle,
    titleFontWeight: FontWeight.bold,
    subTitle: context.localizedString.logOutAlertSubTitle,
    firstButtonTitle: context.localizedString.dialogCommonCancelText,
    secondButtonTitle: context.localizedString.dialogLogOutText,
    isCrossIconHide: crossIconHide,
    onFirstButtonClick: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
    onSecondButtonClick: () async {
      if (coreFlutterDI.isRegistered<LoginEntity>()) {
        coreFlutterDI.unregister<LoginEntity>();
      }
      coreFlutterDI<CommonLocalDataSource>().clearStorage();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('delete_account_initiated', 'false');
      Navigator.of(context, rootNavigator: true)
          .popUntil((route) => route.isFirst);
      Navigator.of(context, rootNavigator: true).pushReplacementNamed(action);
    },
  );
}

void showAlertImageDialog(BuildContext context, String action) async {
  showImageButtonAlertDialog(
    context,
    title: 'Create New Password',
    titleFontWeight: FontWeight.bold,
    subTitle: 'Please create a new password to access the new application',
    firstButtonTitle: 'PROCEED',
    secondButtonTitle: context.localizedString.dialogLogOutText,
    onFirstButtonClick: () {
      Navigator.of(context, rootNavigator: true).pushReplacementNamed(action);
    },
  );
}

Future<void> showProcessingRequestDialog(
  BuildContext context, {
  bool barrierDismissible = false,
  bool userRootNavigator = true,
  String? title,
  String? subtitle,
}) async {
  /// Following condition check if any pop-up is shown on current screen
  /// and avoids showing dialog
  if (ModalRoute.of(context)?.isCurrent == true) {
    return showDialog(
      useRootNavigator: userRootNavigator,
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (ctx) {
        return ProcessingRequestDialog(title: title, subTitle: subtitle);
      },
    );
  }
}

Future<void> showFailedRequestDialog(
  BuildContext context, {
  bool barrierDismissible = false,
  bool userRootNavigator = true,
  String? title,
  String? subtitle,
}) async {
  return showDialog(
    useRootNavigator: userRootNavigator,
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (ctx) {
      return RequestFailedDialog(title: title, subTitle: subtitle);
    },
  );
}

Future showImagePickerDialog(
  BuildContext context, {
  VoidCallback? closeClick,
  bool barrierDismissible = true,
}) {
  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return ImagePickerDialog(
        onCloseClick: closeClick,
      );
    },
  );
}

void showExitDialog(BuildContext context) async {
  showBinaryButtonAlertDialog(
    context,
    title: context.localizedString.applicationClosedAlertTitle,
    titleFontWeight: FontWeight.bold,
    subTitle: context.localizedString.applicationClosedAlertSubTitle,
    firstButtonTitle: context.localizedString.noText,
    secondButtonTitle: context.localizedString.yesText,
    onFirstButtonClick: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
    onSecondButtonClick: () async {
      exit(0);
    },
    isCrossIconHide: false,
  );
}
