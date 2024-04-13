import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/view/features/search_product/data/data_source/remote_data_source/search_product_remote_data_source.dart';
import 'package:pharmarack/view/features/search_product/domain/model/search_product/search_product_model.dart';
import 'package:pharmarack/view/features/search_product/domain/repository/search_product_repository.dart';
import '../../domain/use_case/search_product_use_case.dart';

/// This class [SearchProductRepositoryImpl] is the implementation of [SearchProductRepository]
class SearchProductRepositoryImpl implements SearchProductRepository {
  final SearchProductRemoteDataSource _searchProductRemoteDataSource;

  SearchProductRepositoryImpl(this._searchProductRemoteDataSource);

  @override
  Future<Either<NetworkError, SearchProductModel>> fetchProductFromElastic(
      SearchProductParams searchProductParam) {
    // TODO: implement fetchProductFromElastic
    return _searchProductRemoteDataSource
        .fetchProductFromElastic(searchProductParam);
  }
}
