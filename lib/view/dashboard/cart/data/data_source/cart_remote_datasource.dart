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
      // return right(await _mapCartDetails(r.data));
      return right(CartDetailsModel(statusCode: 200, stores: []));
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
      return right(await _mapCartDetails(r.data));
    });
  }

  Future<CartDetailsModel> _mapCartDetails(
      CartDetailEntity cartDetailEntity) async {
    List<Store> stores = [];
    double totalCartValue = 0.0;
    for (CartListItemEntity cartEntity in cartDetailEntity.cartListItem ?? []) {
      var (freeCount, scheme) = RetailerUtils.getAppliedSchemeAndFreeCount(
          cartEntity.scheme, cartEntity.quantity ?? 0);
      CartListItemModel cartItem = CartListItemModel(
          cartEntity.storeId,
          cartEntity.productId ?? 0,
          cartEntity.storeName,
          cartEntity.partyCode,
          cartEntity.productCode,
          cartEntity.retailerId,
          cartEntity.quantity,
          cartEntity.ptr,
          cartEntity.hiddenPtr,
          (cartEntity.quantity ?? 0) * (double.parse(cartEntity.mrp!)),
          freeCount,
          cartEntity.netRate,
          scheme,
          cartEntity.gstPercentage,
          cartEntity.itemGSTValue,
          cartEntity.deliveryOption,
          cartEntity.remarkForStore,
          cartEntity.productAddedBy,
          cartEntity.priority,
          cartEntity.productName,
          cartEntity.productWiseAmount,
          cartEntity.isDeleted,
          cartEntity.allowMinQty,
          cartEntity.allowMaxQty,
          cartEntity.stepUpValue,
          cartEntity.allowMOQ,
          cartEntity.minItemLimit,
          cartEntity.maxItemLimit,
          cartEntity.minAmountLimit,
          cartEntity.maxAmountLimit,
          cartEntity.minOrderQuantity,
          cartEntity.maxOrderQuantity,
          cartEntity.orderDeliveryModeStatus,
          cartEntity.orderRemarks,
          cartEntity.deliveryPersonList,
          cartEntity.specialRate,
          cartEntity.stock,
          cartEntity.rShowPtr,
          cartEntity.deliveryPerson,
          cartEntity.deliveryPersonCode,
          cartEntity.dateFormat,
          cartEntity.rShowPtrForAllCompanies,
          (cartEntity.company != null && cartEntity.company!.isNotEmpty)
              ? cartEntity.company
              : null,
          cartEntity.isGroupWisePTR,
          cartEntity.isGroupWisePTRRetailer,
          cartEntity.rateValidity,
          cartEntity.storeWiseAmount,
          cartEntity.productWiseGSTAmount,
          cartEntity.cartSource,
          cartEntity.schemeType,
          cartEntity.mrp);

      Store store = stores.firstWhere(
          (store) => store.storeId == cartEntity.storeId, orElse: () {
        return Store(cartEntity.storeId ?? -1, cartEntity.storeName ?? "",
            [cartItem], 0.0, true, false);
      });
      if (!stores.contains(store)) {
        store.total += (cartEntity.quantity ?? 0) * (cartEntity.ptr ?? 0);
        stores.add(store);
      } else {
        store.cartItemList.add(cartItem);
        store.total += (cartEntity.quantity ?? 0) * (cartEntity.ptr ?? 0);
      }
      totalCartValue += (cartEntity.quantity ?? 0) * (cartEntity.ptr ?? 0);
    }

    if (cartDetailEntity.cartListItem!.isNotEmpty) {
      final lastProduct = cartDetailEntity.cartListItem?.last;

      return CartDetailsModel(
        statusCode: cartDetailEntity.statusCode,
        stores: stores,
        totalSelectedStores: stores.length,
        totalItems: cartDetailEntity.cartListItem?.length ?? 0,
        totalCartValue: totalCartValue,
        lastAddedProduct: CartLastItemModel(
          productName: lastProduct?.productName,
          quantity: lastProduct?.quantity,
          scheme: lastProduct?.scheme,
          quantityWithScheme: RetailerUtils.getFreeTabletsCountAsPerScheme(
                      lastProduct?.scheme ?? '', lastProduct?.quantity ?? 0) ==
                  'HS'
              ? 0
              : int.parse(RetailerUtils.getFreeTabletsCountAsPerScheme(
                  lastProduct?.scheme ?? '', lastProduct?.quantity ?? 0)),
        ),
      );
    } else {
      return CartDetailsModel(
        statusCode: cartDetailEntity.statusCode,
        stores: stores,
        totalSelectedStores: stores.length,
        totalItems: cartDetailEntity.cartListItem?.length ?? 0,
        totalCartValue: totalCartValue,
      );
    }
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
