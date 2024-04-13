import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/view/features/search_product/domain/model/add_product_to_cart/add_product_to_cart_model.dart';
import 'package:pharmarack/view/features/search_product/domain/use_case/add_product_to_cart_use_case.dart';

/// This class [AddProductRepository] is the blueprint of network api call
abstract class AddProductRepository {
  Future<Either<NetworkError, AddProductToCartModel>> addProductToCart(
      AddProductToCartUseCaseParam addProductToCartUseCaseParam);
}
