import 'package:flutter/material.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';

void showProgressDialog(BuildContext context) {
  showAdaptiveDialog(
    context: context,
    barrierDismissible: false,
    useRootNavigator: false,
    builder: (ctx) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(),
        backgroundColor: Colors.black,
        titlePadding: const EdgeInsets.only(left: 16, right: 16, top: 8),
        actionsPadding: EdgeInsets.zero,
        title: Text(
          context.localizedString.pleaseWaitTitle,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        content: Row(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(
              width: 20,
            ),
            Text(
              context.localizedString.connectingToServerMsg,
              style: const TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      );
    },
  );
}

void showResponseTextDialog(BuildContext context, String responseText,
    {required Function() onOkButtonClick}) {
  showAdaptiveDialog(
    context: context,
    barrierDismissible: false,
    useRootNavigator: false,
    builder: (ctx) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          context.localizedString.attention,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        titlePadding: const EdgeInsets.only(left: 16, right: 16, top: 8),
        contentPadding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 4),
        actionsPadding: EdgeInsets.zero,
        content: Text(
          responseText,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        actionsAlignment: MainAxisAlignment.end,
        actions: [
          TextButton(
            onPressed: onOkButtonClick,
            child: Text(context.localizedString.ok),
          )
        ],
      );
    },
  );
}

void navigateToMappingScreen(BuildContext context) {
  Navigator.popUntil(context, (route) {
    return route.settings.name == "/mapping";
  });
}

OutlineInputBorder searchBorder({required Color color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: color.withOpacity(0.6),
    ),
  );
}
