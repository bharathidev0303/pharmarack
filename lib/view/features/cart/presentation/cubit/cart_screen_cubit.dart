import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/packages/core/log_util/log_util.dart';
import 'package:pharmarack/packages/core_flutter/common_entity/retailer_info_response_entity.dart';
import 'package:pharmarack/view/features/cart/domain/model/add_product_to_cart_param.dart';
import 'package:pharmarack/view/features/cart/domain/model/cart_details_model.dart';
import 'package:pharmarack/view/features/cart/domain/usecase/add_change_cart_usecase.dart';
import 'package:pharmarack/view/features/cart/domain/usecase/cart_details_usecase.dart';
import 'package:pharmarack/view/features/cart/domain/usecase/cencel_order_usecase.dart';
import 'package:pharmarack/view/features/cart/domain/usecase/place_order_usecase.dart';
import 'package:pharmarack/view/features/cart/presentation/cubit/cart_screen_state.dart';
import 'package:pharmarack/view/onboarding/di/onboarding_provider.dart';
import '../../data/model/place_order_api_request.dart';
import '../../domain/usecase/delete_product_usecase.dart';
import 'draggable_cart/cubit/draggable_cart_cubit.dart';

class CartScreenCubit extends Cubit<CartScreenState> {
  final CartDetailsUseCase _cartDetailsUseCase;
  final AddChangeCartUseCase _changeProductQuantity;
  final DeleteProductUseCase _deleteProductUseCase;
  final PlaceOrderUseCase _placeTempOrderUseCase;
  final CancelOrderUseCase _cancelOrderUseCase;
  bool isCancelEnable = true;
  bool isListUpdate = false;
  int remainingCountdown = 0;
  final GlobalKey<FormState> formSearchKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formQuantityKey = GlobalKey<FormState>();
  final TextEditingController searchController = TextEditingController();

  CartScreenCubit(
    this._cartDetailsUseCase,
    this._changeProductQuantity,
    this._deleteProductUseCase,
    this._placeTempOrderUseCase,
    this._cancelOrderUseCase,
  ) : super(CartScreenInitialState());

  void getCartDetails({bool showLoader = true}) async {
    if (showLoader) {
      emit(CartScreenLoadingState());
    }
    final response =
        await _cartDetailsUseCase.execute(params: CartDetailsParams());
    response.fold((l) {
      emit(const CartScreenErrorState());
    }, (r) {
      if (r == null || r.statusCode != 200) {
        emit(const CartScreenErrorState());
      } else if (r.stores.isEmpty) {
        getIt<DraggableCartScreenCubit>().stores.clear();
        emit(CartScreenNoDataState());
      } else {
        getIt<DraggableCartScreenCubit>().stores.clear();
        getIt<DraggableCartScreenCubit>().stores.addAll(r.stores);
        emit(CartScreenDataState(r, false, true, r.stores.length));
      }
    });
  }

  void refreshScreenData() {
    final details = _cartDetailsUseCase.getCartDetailsData()!;
    emit(CartScreenDataState(details, false, true, details.stores.length));
  }

  void onAllStoreItemsExpandCollapse(bool isExpand) async {
    CartDetailsModel? cartDetails =
        _cartDetailsUseCase.onAllStoreItemsExpandCollapse(isExpand);
    if (cartDetails != null) {
      emit(CartScreenDataState(cartDetails, isExpand, cartDetails.isAllSelected,
          cartDetails.stores.length));
    }
  }

  void onStoreItemExpanded(int storeId, bool isExpanded) async {
    CartDetailsModel? cartDetails =
        _cartDetailsUseCase.onStoreItemsExpanded(storeId, isExpanded);
    if (cartDetails != null) {
      emit(CartScreenDataState(cartDetails, cartDetails.isAllExpanded,
          cartDetails.isAllSelected, cartDetails.totalSelectedStores));
    }
  }

  void onAllStoreSelected(bool selected) async {
    CartDetailsModel? cartDetails =
        _cartDetailsUseCase.onAllStoreSelected(selected);
    if (cartDetails != null) {
      emit(CartScreenDataState(cartDetails, cartDetails.isAllExpanded, selected,
          cartDetails.stores.length));
    }
  }

  void onStoreSelected(int storeId, bool isSelected) async {
    CartDetailsModel? cartDetails =
        _cartDetailsUseCase.onStoreSelected(storeId, isSelected);
    if (cartDetails != null) {
      emit(CartScreenDataState(cartDetails, cartDetails.isAllExpanded,
          cartDetails.isAllSelected, cartDetails.totalSelectedStores));
    }
  }

  validateQuantityField({
    required CartListItemModel cartItem,
    required String quantity,
  }) {
    _changeProductQuantity.validateQuantity(quantity, cartItem).fold((l) {
      final cartDetailsModel = _cartDetailsUseCase.getCartDetailsData()!;
      bool flag = true;
      for (var element in cartDetailsModel.stores) {
        var productList =
            element.cartItemList.where((val) => val.storeId == element.storeId);
        for (var product in productList) {
          if (product.productCode == cartItem.productCode) {
            flag = false;
            product.errorMessage = l.error.message;
          }
          if (!flag) {
            product.isValid = false;
          }
        }
        if (!flag) {
          element.isStoreValid = false;
        }
      }
      emit(CartScreenDataState(cartDetailsModel, cartDetailsModel.isAllExpanded,
          cartDetailsModel.isAllSelected, cartDetailsModel.totalSelectedStores,
          isListUpdate: getListUpdateFlag()));
    }, (r) {
      onProductQuantityChange(quantity, cartItem);
    });
  }

  void onProductQuantityChange(
      String quantityText, CartListItemModel cartItem) async {
    emit(CartScreenLoadingState());
    int quantity = 0;
    try {
      quantity = int.parse(quantityText);
      AddChangeCartParam params = AddChangeCartParam(
          addProductToCartParam: AddProductToCartParams(
              storeId: cartItem.storeId ?? -1,
              quantity: quantity,
              productCode: cartItem.productCode ?? "",
              ptr: cartItem.ptr ?? 0,
              hiddenPTR: cartItem.hiddenPtr ?? 0.0,
              gSTPercentage: cartItem.gstPercentage ?? 0.0,
              cartSource: 'MOVP',
              isDODProductCheck: 1,
              isDODPreferenceSet: 0,
              isDODProductSelected: 0));
      final response = await _changeProductQuantity.execute(params: params);
      response.fold((l) {
        emit(const CartScreenErrorState());
      }, (r) {
        if (r == null || r.statusCode != 200) {
          emit(const CartScreenErrorState());
        } else if (r.stores.isEmpty) {
          getIt<DraggableCartScreenCubit>().stores.clear();
          emit(CartScreenNoDataState());
        } else {
          getIt<DraggableCartScreenCubit>().stores.clear();
          getIt<DraggableCartScreenCubit>().stores.addAll(r.stores);
          emit(CartScreenDataState(r, false, true, r.stores.length));
        }
      });
    } on FormatException {
      emit(const CartScreenErrorState());
      LogUtil.error("Invalid quantity");
    }
  }

  Future<void> deleteCartProduct({
    required String storeId,
    required String productId,
  }) async {
    final param = DeleteProductParams(
      deleteProductRequestParam: DeleteProductRequestParam(
        storeId: storeId,
        productCode: productId,
      ),
    );

    emit(CartScreenLoadingState());
    final response = await _deleteProductUseCase.execute(params: param);
    response.fold((l) {
      emit(const CartScreenErrorState());
    }, (r) {
      if (r == null || r.statusCode != 200) {
        emit(const CartScreenErrorState());
      } else if (r.stores.isEmpty) {
        getIt<DraggableCartScreenCubit>().stores.clear();
        emit(CartScreenNoDataState());
      } else {
        getIt<DraggableCartScreenCubit>().stores.clear();
        getIt<DraggableCartScreenCubit>().stores.addAll(r.stores);
        emit(CartScreenDataState(r, false, true, r.stores.length));
      }
    });
  }

  Future<void> placeOrder() async {
    emit(CartScreenLoadingState());
    final response = await _placeTempOrderUseCase.execute(
        params: getPlaceOrderRequestData());
    response.fold((l) {
      emit(CartScreenErrorState(errorMessage: l.getFriendlyMessage()));
    }, (r) {
      var json = jsonDecode(r!);
      if (json['StatusCode'] != 200) {
        emit(CartScreenErrorState(errorMessage: json['Message']));
      } else {
        emit(PlaceOrderSuccess());
      }
    });
  }

  Future<void> cancelOrder() async {
    emit(CartScreenLoadingState());
    final response = await _cancelOrderUseCase.execute(
        params: CancelOrderParams(tempOrderId: ''));
    response.fold((l) {
      emit(const CartScreenErrorState());
    }, (r) {
      var json = jsonDecode(r);
      if (json['StatusCode'] != 200) {
        emit(const CartScreenErrorState());
      } else {
        emit(const CancelOrderSuccessState());
      }
    });
  }

  bool checkOrderIsValid() {
    final cartDetailsModel = _cartDetailsUseCase.getCartDetailsData()!;
    bool flag = true;
    double amount = 0;
    for (var element in cartDetailsModel.stores) {
      var productList =
          element.cartItemList.where((val) => val.storeId == element.storeId);
      for (var product in productList) {
        amount = amount + product.productWiseAmount!;
        if (product.allowMinQty! != 0 &&
            product.allowMinQty! > product.quantity!) {
          flag = false;
          product.errorMessage =
              'you can order min ${product.allowMinQty!} quantity';
        } else if (product.allowMaxQty! != 0 &&
            product.allowMaxQty! < product.quantity!) {
          flag = false;
          product.errorMessage =
              'you can order max ${product.allowMaxQty!} quantity';
        } else if (product.minAmountLimit != 0 &&
            product.minAmountLimit! > amount) {
          flag = false;
          product.errorMessage =
              'Your minimum order amount limit for this products is ₹${product.minAmountLimit}';
        } else if (product.maxAmountLimit != 0 &&
            product.maxAmountLimit! < amount) {
          flag = false;
          product.errorMessage =
              'Your maximum order amount limit for this products is ₹${product.maxAmountLimit}';
        }
        /*else if (product.orderDeliveryModeStatus == 0) {
          flag = false;
          product.errorMessage = 'Delivery mode is not valid';
        } else if (product.stock! < product.quantity!) {
          flag = false;
          product.errorMessage = 'Out of stock. change distributor.';
        }*/

        if (!flag) {
          product.isValid = false;
        }
      }
      if (amount > 10000000) {
        flag = false;
      }

      if (!flag) {
        element.isStoreValid = false;
      }
    }
    if (!flag) {
      emit(CartScreenDataState(cartDetailsModel, cartDetailsModel.isAllExpanded,
          cartDetailsModel.isAllSelected, cartDetailsModel.totalSelectedStores,
          isListUpdate: getListUpdateFlag()));
    }
    return flag;
  }

  PlaceOrderParam getPlaceOrderRequestData() {
    final cartDetailsModel = _cartDetailsUseCase.getCartDetailsData()!;
    late List<Item> itemList = [];
    late List<PlaceOrderApiRequest> request = [];
    double amount = 0;
    double gstAmount = 0;
    Iterable<CartListItemModel> productList;
    for (var element in cartDetailsModel.stores) {
      if (element.isSelected) {
        productList =
            element.cartItemList.where((val) => val.storeId == element.storeId);
        for (var product in productList) {
          amount = amount + product.productWiseAmount!;
          gstAmount = gstAmount + product.productWiseGSTAmount!;
          itemList.add(Item(
            free: product.free ?? 0,
            hiddenPtr: product.hiddenPtr ?? 0,
            netRate: product.netRate ?? 0,
            productCode: product.productCode ?? '',
            productName: product.productName ?? '',
            ptr: product.ptr ?? 0,
            quantity: product.quantity ?? 0,
            scheme: product.scheme ?? '',
            schemeType: product.schemeType ?? '',
          ));
        }
        request.add(PlaceOrderApiRequest(
            ipAddress: "198.1.3.1.1",
            gstAmount: gstAmount,
            items: itemList,
            latitude: "18.533821",
            longitude: "73.829761",
            orderSource: productList.first.cartSource!,
            os: Platform.isAndroid
                ? 'Android'
                : Platform.isIOS
                    ? 'IOS'
                    : 'web',
            storeId: element.storeId,
            sKipAndContinue: 1,
            version: Platform.version,
            orderDeliveryModeText:
                productList.first.orderDeliveryModeStatus.toString(),
            orderRemarksText: productList.first.orderRemarks.toString(),
            deliveryPerson: productList.first.deliveryPerson ?? '',
            deliveryPersonCode: productList.first.deliveryPersonCode ?? '',
            orderPlacedBy: onboardingDI<RetailerInfoEntity>().userId ?? 0,
            browserName: Platform.isAndroid
                ? 'Android'
                : Platform.isIOS
                    ? 'IOS'
                    : 'web',
            macAddress: Platform.localeName,
            storeWiseAmount: amount));
      }
    }
    return PlaceOrderParam(list: request);
  }

  void updateCancelOrderState(bool flag) {
    isCancelEnable = flag;
    emit(const CancelOrderEnableState());
  }

  void updateCartItemAmount(CartListItemModel cartItem, String value) {
    final cartDetailsModel = _cartDetailsUseCase.getCartDetailsData()!;
    Iterable<CartListItemModel> productList;
    for (var element in cartDetailsModel.stores) {
      productList =
          element.cartItemList.where((val) => val.storeId == element.storeId);
      for (var product in productList) {
        //product.mrp=product.mrp! * int.parse(value);
        product.totalAmount = double.parse(product.mrp!) * int.parse(value);
      }
    }
    emit(CartScreenDataState(cartDetailsModel, cartDetailsModel.isAllExpanded,
        cartDetailsModel.isAllSelected, cartDetailsModel.totalSelectedStores,
        isListUpdate: getListUpdateFlag()));
  }

  getListUpdateFlag() {
    return isListUpdate = !isListUpdate;
  }
}
