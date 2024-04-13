import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/base_usecase.dart';
import 'package:pharmarack/packages/core_flutter/core/base_usecase/params.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/features/search_product/domain/model/search_product/search_product_model.dart';
import 'package:pharmarack/view/features/search_product/domain/repository/search_product_repository.dart';

import '../model/search_product/elastic_seach_api_request.dart';

/// This class [SearchProductUseCase] is the Behaviour that we
/// want for the respective page via [Cubit]
class SearchProductUseCase
    extends BaseUseCase<BaseError, SearchProductParams, SearchProductModel> {
  final SearchProductRepository _searchProductRepository;

  SearchProductUseCase(this._searchProductRepository);

  @override
  Future<Either<BaseError, SearchProductModel>> execute(
      {required SearchProductParams params}) {
    return _searchProductRepository.fetchProductFromElastic(params);
  }
}

class SearchProductParams extends Params {
  final ElasticSearchApiRequest elasticSearchApiRequest;

  SearchProductParams(this.elasticSearchApiRequest);
}
