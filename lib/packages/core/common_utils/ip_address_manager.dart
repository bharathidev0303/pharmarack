import 'package:get_ip_address/get_ip_address.dart';

///
/// IpAddressManager this class is used to get public ip address
/// of the device.
///
class IpAddressManager {
  static Future<String> getIpAddress() async {
    try {
      var ipAddress = IpAddress(type: RequestType.text);

      dynamic data = await ipAddress.getIpAddress();
      return data.toString();
    } catch (e) {
      return Future.value("");
    }
  }
}
