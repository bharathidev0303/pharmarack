import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/view/dashboard/cart/data/data_source/cart_remote_datasource.dart';
import 'package:pharmarack/view/dashboard/cart/data/model/place_order_api_request.dart';
import 'package:pharmarack/view/dashboard/cart/domain/model/cart_details_model.dart';
import 'package:pharmarack/view/dashboard/cart/domain/repository/cart_repository.dart';
import 'package:pharmarack/view/dashboard/cart/domain/usecase/delete_product_usecase.dart';

import '../../domain/usecase/add_change_cart_usecase.dart';

class CartRepositoryImpl extends CartRepository {
  final CartRemoteDataSource _cartRemoteDataSource;
  CartDetailsModel? _cartDetails;

  CartRepositoryImpl(this._cartRemoteDataSource);

  @override
  Future<Either<NetworkError, CartDetailsModel?>> getCartDetails() async {
    final response = await _cartRemoteDataSource.getCartDetails();
    return response.fold((l) => left(l), (r) {
      _cartDetails = r;
      return right(r);
    });
  }

  @override
  CartDetailsModel? getCartDetailsData() => _cartDetails;

  @override
  Future<Either<NetworkError, CartDetailsModel?>> deleteProduct(
    DeleteProductRequestParam params,
  ) async {
    final response = await _cartRemoteDataSource.deleteProduct(params);
    return response.fold((l) => left(l), (r) {
      _cartDetails = r;
      return right(r);
    });
  }

  @override
  updateCartDetailsData(CartDetailsModel? cartDetailsModel) {
    _cartDetails = cartDetailsModel;
  }

  @override
  Future<Either<NetworkError, CartDetailsModel>> addProductToCart(
      AddChangeCartParam addChangeCartParam) async {
    final response =
        await _cartRemoteDataSource.addProductToCart(addChangeCartParam);
    return response.fold((l) => left(l), (cartDetail) {
      if (_cartDetails != null) {
        for (Store store in cartDetail.stores) {
          for (Store str in _cartDetails!.stores) {
            if (store.storeId == str.storeId) {
              store.isSelected = str.isSelected;
              store.isExpanded = str.isExpanded;
            }
          }
        }
      }
      _cartDetails = cartDetail;
      return right(cartDetail);
    });
  }

  @override
  Future<Either<NetworkError, CartDetailsModel?>> getStoreDetails(
      DeleteProductRequestParam params) {
    throw UnimplementedError();
  }

  @override
  Future<Either<NetworkError, String?>> placeOrder(
      List<PlaceOrderApiRequest> apiRequest) async {
    // TODO: implement placeTempOrder
    final response = await _cartRemoteDataSource.placeOrder(apiRequest);
    return response.fold((l) => left(l), (r) => right(r));
  }

  @override
  Future<Either<NetworkError, String>> cancelOrder(
      Map<String, String> request) async {
    // TODO: implement cancelOrder
    final response = await _cartRemoteDataSource.cancelOrder(request);
    return response.fold((l) => left(l), (r) => right(r));
  }
}
