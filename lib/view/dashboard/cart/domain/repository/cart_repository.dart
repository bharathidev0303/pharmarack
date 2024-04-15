import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/view/dashboard/cart/data/model/place_order_api_request.dart';
import 'package:pharmarack/view/dashboard/cart/domain/usecase/delete_product_usecase.dart';
import '../model/cart_details_model.dart';
import '../usecase/add_change_cart_usecase.dart';

abstract class CartRepository {
  Future<Either<NetworkError, CartDetailsModel?>> getCartDetails();

  CartDetailsModel? getCartDetailsData();

  Future<Either<NetworkError, CartDetailsModel?>> deleteProduct(
      DeleteProductRequestParam params);

  updateCartDetailsData(CartDetailsModel? cartDetailsModel);

  Future<Either<NetworkError, CartDetailsModel>> addProductToCart(
      AddChangeCartParam addChangeCartParam);

  Future<Either<NetworkError, CartDetailsModel?>> getStoreDetails(
      DeleteProductRequestParam params);

  Future<Either<NetworkError, String>> cancelOrder(Map<String, String> request);

  Future<Either<NetworkError, String?>> placeOrder(
      List<PlaceOrderApiRequest> apiRequest);
}
