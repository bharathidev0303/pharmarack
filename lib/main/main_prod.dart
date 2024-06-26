import 'package:pharmarack/main/flavor.dart';
import 'package:pharmarack/main/main_common.dart';

void main() {
  var flavor = Flavor(
      appTitle: "Pharmarack Retailer",
      legacyBaseUrl: "https://www.pharmarack.com",
      cmsGatewayBaseUrl:
          "https://pharmretail-modernization-dev-cmsgateway.pharmarack.com/",
      baseUrl: "https://pharmretail-modernization-prod-api.pharmarack.com/",
      flyBaseUrl: "https://stage-partner-api.theflyy.com",
      elasticSearchBaseUrl:
          'https://pharmretail-modernization-dev-elasticsearch.pharmarack.com/',
      env: Env.prod);
  mainCommon(flavor);
}
