import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/view/features/search_product/domain/model/add_product_to_cart/add_product_to_cart_model.dart';
import 'package:pharmarack/view/features/search_product/domain/use_case/add_product_to_cart_use_case.dart';
import '../../domain/repository/add_product_repository.dart';
import '../data_source/remote_data_source/add_product_remote_data_source.dart';

/// This class [AddProductRepositoryImpl] is the implementation of [SearchProductRepository]
class AddProductRepositoryImpl implements AddProductRepository {
  final AddProductRemoteDataSource _addProductRemoteDataSource;

  AddProductRepositoryImpl(this._addProductRemoteDataSource);

  @override
  Future<Either<NetworkError, AddProductToCartModel>> addProductToCart(
      AddProductToCartUseCaseParam addProductToCartUseCaseParam) {
    return _addProductRemoteDataSource
        .addProductToCart(addProductToCartUseCaseParam);
  }
}
