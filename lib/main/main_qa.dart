import 'package:pharmarack/main/flavor.dart';
import 'package:pharmarack/main/main_common.dart';
// import 'package:flutter_driver/driver_extension.dart';

void main() {
  // enableFlutterDriverExtension();
  var flavor = Flavor(
      appTitle: "Pharmarack Retailer QA",
      legacyBaseUrl: "http://tesla.pharmarack.com",
      baseUrl: "https://pharmretail-modernization-qa-api.pharmarack.com/",
      cmsGatewayBaseUrl:
          "https://pharmretail-modernization-dev-cmsgateway.pharmarack.com/",
      flyBaseUrl: "https://stage-partner-api.theflyy.com",
      env: Env.qa);
  mainCommon(flavor);
}
