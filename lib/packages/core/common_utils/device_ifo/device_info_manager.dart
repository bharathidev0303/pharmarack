import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:pharmarack/packages/core/common_utils/device_ifo/device_info.dart';

///
/// DeviceInfoManager this class is used to get device information
/// of the device. From [BaseDeviceInfo] you can get multiple device info values
///
class DeviceInfoManager {
  static Future<DeviceInfo> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      var androidInfo = await deviceInfo.androidInfo;
      return DeviceInfo(
        model: androidInfo.model,
        manufacturer: androidInfo.manufacturer,
        os: ("Android"),
        version: androidInfo.version.release,
        deviceId: androidInfo.id,
      );
    } else if (Platform.isIOS) {
      var iosInfo = await deviceInfo.iosInfo;
      return DeviceInfo(
        model: iosInfo.model,
        manufacturer: "Apple",
        os: iosInfo.systemName,
        version: iosInfo.systemVersion,
        deviceId: iosInfo.identifierForVendor ?? "",
      );
    } else {
      var webInfo = await deviceInfo.webBrowserInfo;
      return DeviceInfo(
        model: webInfo.userAgent ?? "",
        manufacturer: "",
        os: "Web",
        version: webInfo.appVersion ?? "",
        deviceId:
            "${(webInfo.vendor ?? "")}${(webInfo.userAgent ?? "")}${webInfo.hardwareConcurrency.toString()}",
      );
    }
  }
}
