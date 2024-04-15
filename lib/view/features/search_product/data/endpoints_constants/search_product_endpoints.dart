import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';

/// This class [SearchProductEndpoints] is used to contain all Api
/// endpoint related to [search_product] feature.
///
///
class SearchProductEndpoints {
  static const String elasticSearchProduct = '/elastic-search/api/v1/search';
  static const String elasticSearchCompanyProduct =
      '/elastic-search/api/v1/search/company';
  static const String elasticSearchTheropyProduct =
      '/elastic-search/api/v1/search/therapy';
  static const String searchProduct =
      "/search/api/${AppConstants.apiVersion}/GetProductListForPSSearch";
  static const String searchByProduct =
      "/search/api/${AppConstants.apiVersion}/GetDisplayStoreProductsAccrossStoresNewPost";

  static const String addProductToCart =
      '/cart/api/${AppConstants.apiVersion}/AddUserProductCartDetail';

  static const String getMoleculesAndCompanies =
      '/search/api/${AppConstants.apiVersion}/GetStoreMoleculeCompanyData';
}
