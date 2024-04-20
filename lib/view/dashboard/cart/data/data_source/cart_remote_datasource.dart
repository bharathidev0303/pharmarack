import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/core/safe_api_call/safe_api_call.dart';
import 'package:pharmarack/packages/core_flutter/error/network_error.dart';
import 'package:pharmarack/packages/storage_utils/box_constants/box_name_constants.dart';
import 'package:pharmarack/packages/storage_utils/storage.dart';
import 'package:pharmarack/packages/storage_utils/storage_factory.dart';
import 'package:pharmarack/utils/retailer_utils.dart';
import 'package:pharmarack/view/dashboard/cart/data/api_service/cart_api_service.dart';
import 'package:pharmarack/view/dashboard/cart/data/model/cart_detail.dart';
import 'package:pharmarack/view/dashboard/cart/data/model/place_order_api_request.dart';
import 'package:pharmarack/view/dashboard/cart/domain/model/cart_details_model.dart';
import 'package:pharmarack/view/dashboard/cart/domain/usecase/delete_product_usecase.dart';
import '../../domain/usecase/add_change_cart_usecase.dart';

class CartRemoteDataSource {
  final CartApiService _cartApiService;

  Storage? storage;

  CartRemoteDataSource(this._cartApiService) {
    storage = StorageFactory.getStorage(
        isSecure: false, boxName: BoxName.retailerAppBoxName);
  }

  Future<Either<NetworkError, CartDetailsModel>> getCartDetails() async {
    final response = await safeApiCall(_cartApiService.getCartDetails());
    return response.fold((l) => left(l), (r) async {
      return right(await _mapCartDetails(r.data));
    });
  }

  Future<Either<NetworkError, CartDetailsModel>> deleteProduct(
      DeleteProductRequestParam deleteProductRequestParam) async {
    final response = await safeApiCall(_cartApiService.deleteProduct(
        storeId: deleteProductRequestParam.storeId,
        productCode: deleteProductRequestParam.productCode));
    return response.fold((l) => left(l), (r) async {
      return right(await _mapCartDetails(r.data));
    });
  }

  Future<Either<NetworkError, CartDetailsModel>> addProductToCart(
      AddChangeCartParam param) async {
    final response = await safeApiCall(_cartApiService.addProductToCartApi(
        storeId: param.addProductToCartParam.storeId,
        quantity: param.addProductToCartParam.quantity,
        cartSource: param.addProductToCartParam.cartSource,
        gSTPercentage: param.addProductToCartParam.gSTPercentage,
        hiddenPTR: param.addProductToCartParam.hiddenPTR,
        isDODPreferenceSet: param.addProductToCartParam.isDODPreferenceSet,
        isDODProductCheck: param.addProductToCartParam.isDODProductCheck,
        isDODProductSelected: param.addProductToCartParam.isDODProductSelected,
        productCode: param.addProductToCartParam.productCode,
        ptr: param.addProductToCartParam.ptr));
    return response.fold((l) => left(l), (r) async {
      // return right(CartDetailsModel(statusCode: 200, stores: []));
      return right(await _mapCartDetails(r.data));
    });
  }

  Future<CartDetailsModel> _mapCartDetails(
      CartDetailEntity cartDetailEntity) async {
    final List<Store> stores = cartDetailEntity.cartListItem!
        .map((store) => Store(store.storeId!, store.storeName!,
            store.cartItemList!, store.total!, true, false))
        .toList();

    double totalCartValue =
        double.parse(cartDetailEntity.cartTotal?.totalCartValue as String);
    print(totalCartValue);

    return CartDetailsModel(
      statusCode: cartDetailEntity.statusCode,
      stores: stores,
      totalSelectedStores: stores.length,
      totalItems: cartDetailEntity.cartTotal?.totalItems ?? 0,
      totalCartValue: totalCartValue,
    );
  }

  Future<Either<NetworkError, CartDetailsModel>> getStoreDetails(
      DeleteProductRequestParam deleteProductRequestParam) async {
    final response = await safeApiCall(_cartApiService.getStoreDetails(
        storeId: deleteProductRequestParam.storeId));
    return response.fold((l) => left(l), (r) async {
      return right(await _mapCartDetails(r.data));
    });
  }

  Future<Either<NetworkError, String>> cancelOrder(
      Map<String, String> request) async {
    final response = await safeApiCall(_cartApiService.cancelOrder(request));
    return response.fold((l) => left(l), (r) {
      return right((r.data));
    });
  }

  Future<Either<NetworkError, String>> placeOrder(
      List<PlaceOrderApiRequest> placeOrderApiRequest) async {
    final response =
        await safeApiCall(_cartApiService.placeOrder(placeOrderApiRequest));
    return response.fold((l) => left(l), (r) {
      return right((r.data));
    });
  }
}
