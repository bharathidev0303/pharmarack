import 'package:pharmarack/packages/core_flutter/utils/app_constants.dart';

class TopWidgetsViewMoreEndpoints {
  static const String distributorList =
      "/widgets/api/${AppConstants.apiVersion}/getListOfAllDistributors";
  static const String brandsList =
      "/widgets/api/${AppConstants.apiVersion}/getListOfAllBrands";
  static const String productsList =
      "/widgets/api/${AppConstants.apiVersion}/getAllOfferedProducts";
}
