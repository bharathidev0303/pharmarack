import 'package:pharmarack/main/flavor.dart';
import 'package:pharmarack/main/main_common.dart';

void main() {
  /// Proxy base url used for Charles proxy passed as environment variable
  /// eg,
  ///   flutter run --dart-define="PROXY_BASE_URL=<device-ip-address>:8888"
  ///   --dart-define can also be passed as additional run arguments in Android Studio run configuration
  /// 8888 is a default charles proxy port
  ///
  /// For android use external ip address. eg, 192.168.0.43:8888
  /// for other platforms use localhost. eg, localhost:8888
  const proxyBaseUrl = String.fromEnvironment('PROXY_BASE_URL');

  var flavor = Flavor(
    appTitle: "Pharmarack Retailer Dev",
    legacyBaseUrl: "http://tesla.pharmarack.com",
    baseUrl: "https://pharmretail-modernization-dev-api.pharmarack.com/",
    cmsGatewayBaseUrl:
        "https://pharmretail-modernization-dev-cmsgateway.pharmarack.com/",
    flyBaseUrl: "https://stage-partner-api.theflyy.com",
    proxyBaseUrl: proxyBaseUrl,
  );
  mainCommon(flavor);
}
