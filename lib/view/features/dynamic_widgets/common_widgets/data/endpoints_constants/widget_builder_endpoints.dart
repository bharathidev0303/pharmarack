import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';

class WidgetBuilderEndpoints {
  static const String feedback =
      "/widgets/api/${AppConstants.apiVersion}/feedback/list";
}

class ProductsEndpoints {
  static const String feedback =
      "/widgets/api/${AppConstants.apiVersion}/feedback/list";
  static const String topPicks =
      "/widgets/api/${AppConstants.apiVersion}/products/top_picks";
  static const String topOffers =
      "/widgets/api/${AppConstants.apiVersion}/products/top_offers";
  static const String recentlyOrdered =
      "/widgets/api/${AppConstants.apiVersion}/products/recently_ordered";
  static const String popularNearYou =
      "/widgets/api/${AppConstants.apiVersion}/products/popular_near_you";
  static const String frequentlySearches =
      "/widgets/api/${AppConstants.apiVersion}/products/frequently_searches";
}

class DistributorsEndpoints {
  static const String yourDistributors =
      "/widgets/api/${AppConstants.apiVersion}/distributors/your_distributors";
  static const String preferredDistributors =
      "/widgets/api/${AppConstants.apiVersion}/distributors/preferred_distributors";
}
