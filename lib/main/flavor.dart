class Flavor {
  final String appTitle;
  final String legacyBaseUrl;
  final String baseUrl;
  final String cmsGatewayBaseUrl;
  final String flyBaseUrl;
  final String elasticSearchBaseUrl;
  final Env env;
  final String proxyBaseUrl;

  Flavor({
    required this.appTitle,
    required this.legacyBaseUrl,
    required this.baseUrl,
    required this.cmsGatewayBaseUrl,
    required this.flyBaseUrl,
    required this.elasticSearchBaseUrl,
    this.env = Env.dev,
    this.proxyBaseUrl = '',
  }) {
    if (env == Env.prod && proxyBaseUrl.isNotEmpty) {
      throw Exception("proxyBaseUrl should not be used on prod env");
    }
  }
}

enum Env { dev, uat, prod, qa }
