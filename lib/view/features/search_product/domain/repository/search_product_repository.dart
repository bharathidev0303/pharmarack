import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/view/features/search_product/domain/model/search_product/search_product_model.dart';
import 'package:pharmarack/view/features/search_product/domain/use_case/search_product_use_case.dart';

/// This class [SearchProductRepository] is the blueprint of network api call
abstract class SearchProductRepository {
  Future<Either<NetworkError, SearchProductModel>> fetchProductFromElastic(
      SearchProductParams searchProductParam);

  Future<Either<NetworkError, SearchProductModel>>
      fetchCompanyProductFromElastic(
          SearchCompanyProductParams searchCompanyProductParam);
}
