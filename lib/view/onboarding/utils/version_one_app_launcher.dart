import 'dart:io';

import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher_string.dart';

void openPharmaRetailerApp() {
  if (Platform.isAndroid) {
    try {
      launchUrlString(
          "market://details?id=com.growthaccel.pharmarack_retailer");
    } on PlatformException catch (e) {
      launchUrlString(
          "https://play.google.com/store/apps/details?id=com.growthaccel.pharmarack_retailer");
    } finally {
      launchUrlString(
          "https://play.google.com/store/apps/details?id=com.growthaccel.pharmarack_retailer");
      SystemNavigator.pop();
    }
  } else {
    try {
      launchUrlString("https://apps.apple.com/app/id1089120318");
    } on PlatformException catch (e) {
      launchUrlString("https://apps.apple.com/app/id1089120318");
    } finally {
      launchUrlString("https://apps.apple.com/app/id1089120318");
      exit(0);
    }
  }
}
