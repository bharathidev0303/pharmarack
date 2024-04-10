import 'package:flutter/widgets.dart';
import 'package:pharmarack/packages/core_flutter/localization/localization_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../common_widgets/common_dialogs/common_dialongs.dart';

void launchMobileNumber(String value) async {
  if (value.isNotEmpty) {
    final mobileNumber = Uri.parse("tel:$value");

    if (await canLaunchUrl(mobileNumber)) {
      launchUrl(mobileNumber);
    }
  }
}

void launchSupportEmail(BuildContext context, String email) async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: email,
  );
  if (await canLaunchUrl(params)) {
    await launchUrl(params);
  } else {
    if (context.mounted) {
      CommonDialogs.showSimpleDialog(
          parentContext: context,
          title: context.localizedString.somethingWentWrong,
          subTitle: context.localizedString.couldNotLaunchUrl(params.path),
          buttonTitle: context.localizedString.ok);
    }
  }
}

Future<void> urlLauncher(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}

void launchGenericUrl(BuildContext context, String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    if (context.mounted) {
      CommonDialogs.showSimpleDialog(
          parentContext: context,
          title: context.localizedString.somethingWentWrong,
          subTitle: context.localizedString.couldNotLaunchUrl(url),
          buttonTitle: context.localizedString.ok);
    }
  }
}
