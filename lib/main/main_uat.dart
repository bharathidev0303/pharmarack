import 'package:pharmarack/main/flavor.dart';
import 'package:pharmarack/main/main_common.dart';

void main() {
  var flavor = Flavor(
      appTitle: "Pharmarack Retailer UAT",
      legacyBaseUrl: "http://tesla.pharmarack.com",
      baseUrl: "https://pharmretail-modernization-qa-api.pharmarack.com/",
      cmsGatewayBaseUrl:
          "https://pharmretail-modernization-dev-cmsgateway.pharmarack.com/",
      flyBaseUrl: "https://stage-partner-api.theflyy.com",
      elasticSearchBaseUrl:
          'https://pharmretail-modernization-dev-elasticsearch.pharmarack.com/',
      env: Env.uat);
  mainCommon(flavor);
}
